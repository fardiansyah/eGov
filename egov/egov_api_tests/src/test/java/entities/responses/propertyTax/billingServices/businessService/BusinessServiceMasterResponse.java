package entities.responses.propertyTax.billingServices.businessService;

import org.codehaus.jackson.annotate.JsonProperty;

public class BusinessServiceMasterResponse {

    @JsonProperty("ResponseInfo")
    private ResponseInfo ResponseInfo;

    @JsonProperty("BusinessServiceDetails")
    private BusinessServiceDetails[] BusinessServiceDetails;

    public entities.responses.propertyTax.billingServices.businessService.ResponseInfo getResponseInfo() {
        return this.ResponseInfo;
    }

    public void setResponseInfo(entities.responses.propertyTax.billingServices.businessService.ResponseInfo ResponseInfo) {
        this.ResponseInfo = ResponseInfo;
    }

    public entities.responses.propertyTax.billingServices.businessService.BusinessServiceDetails[] getBusinessServiceDetails() {
        return this.BusinessServiceDetails;
    }

    public void setBusinessServiceDetails(entities.responses.propertyTax.billingServices.businessService.BusinessServiceDetails[] BusinessServiceDetails) {
        this.BusinessServiceDetails = BusinessServiceDetails;
    }
}