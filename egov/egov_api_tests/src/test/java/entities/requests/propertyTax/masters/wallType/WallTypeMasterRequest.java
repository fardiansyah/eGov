package entities.requests.propertyTax.masters.wallType;

import entities.requests.propertyTax.RequestInfo;
import org.codehaus.jackson.annotate.JsonProperty;

public class WallTypeMasterRequest {

    @JsonProperty("RequestInfo")
    private RequestInfo requestInfo;

    private WallTypes[] wallTypes;

    public RequestInfo getRequestInfo() {
        return requestInfo;
    }

    public void setRequestInfo(RequestInfo requestInfo) {
        this.requestInfo = requestInfo;
    }

    public WallTypes[] getWallTypes() {
        return wallTypes;
    }

    public void setWallTypes(WallTypes[] wallTypes) {
        this.wallTypes = wallTypes;
    }
}
