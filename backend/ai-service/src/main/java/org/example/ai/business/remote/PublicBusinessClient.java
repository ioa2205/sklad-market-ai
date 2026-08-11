package org.example.ai.business.remote;

import org.example.ai.gateway.GatewayNotFoundException;
import org.example.ai.gateway.GatewayUnavailableException;
import org.example.ai.gateway.dto.GatewayEnvelope;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;

import java.time.Duration;

/** Credential-free crawler for public company and catalog projections. */
@Component
public class PublicBusinessClient {

    private final RestClient restClient;

    public PublicBusinessClient(
            @Value("${ai.gateway.base-url}") String baseUrl,
            @Value("${ai.limits.request-timeout-seconds:60}") int timeoutSeconds) {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        int timeoutMillis = (int) Duration.ofSeconds(timeoutSeconds).toMillis();
        requestFactory.setConnectTimeout(timeoutMillis);
        requestFactory.setReadTimeout(timeoutMillis);
        this.restClient = RestClient.builder().baseUrl(baseUrl).requestFactory(requestFactory).build();
    }

    public RemoteBusinessProductPage fetchProducts(int page, int perPage) {
        GatewayEnvelope<RemoteBusinessProductPage> envelope = get(
                "/api/v1/products/all?page={page}&per_page={perPage}",
                new ParameterizedTypeReference<GatewayEnvelope<RemoteBusinessProductPage>>() {},
                page, perPage);
        return envelope == null ? null : envelope.data();
    }

    public RemoteCompanyPage fetchVerifiedCompanies(int page, int perPage) {
        GatewayEnvelope<RemoteCompanyPage> envelope = get(
                "/api/v1/companies/search?verified=true&page={page}&per_page={perPage}",
                new ParameterizedTypeReference<GatewayEnvelope<RemoteCompanyPage>>() {},
                page, perPage);
        return envelope == null ? null : envelope.data();
    }

    private <T> T get(String uri, ParameterizedTypeReference<T> type, Object... variables) {
        try {
            return restClient.get().uri(uri, variables)
                    .header(HttpHeaders.ACCEPT_LANGUAGE, "UZ")
                    .retrieve().body(type);
        } catch (HttpStatusCodeException e) {
            if (e.getStatusCode().is4xxClientError()) {
                throw new GatewayNotFoundException("Public business endpoint rejected " + uri, e);
            }
            throw new GatewayUnavailableException("Public business endpoint failed " + uri, e);
        } catch (RestClientException e) {
            throw new GatewayUnavailableException("Public business endpoint unavailable " + uri, e);
        }
    }
}
