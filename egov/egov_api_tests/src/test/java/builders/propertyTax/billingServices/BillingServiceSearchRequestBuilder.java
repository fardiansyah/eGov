package builders.propertyTax.billingServices;

import entities.requests.propertyTax.RequestInfo;
import entities.requests.propertyTax.billingServices.BillingServiceSearchRequest;

public class BillingServiceSearchRequestBuilder {

    BillingServiceSearchRequest request = new BillingServiceSearchRequest();

    public BillingServiceSearchRequestBuilder withRequestInfo(RequestInfo requestInfo){
        request.setRequestInfo(requestInfo);
        return this;
    }

    public BillingServiceSearchRequest build(){
        return request;
    }
}