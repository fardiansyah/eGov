package tests.pgrCollection;

import com.jayway.restassured.response.Response;
import entities.pgrCollection.LocationNameResponse;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.junit.Assert;
import org.testng.annotations.Test;
import resources.PGRComplaintResource;
import tests.BaseAPITest;
import utils.APILogger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GetLocationNameTest extends BaseAPITest{

    @Test
    public void getParticularLocationName() throws IOException{

        Response response = new PGRComplaintResource().getParticularLocationName("konda peta");

        List<LocationNameResponse> locations = getResponseObjectArray(response);

        Assert.assertEquals(response.getStatusCode() , 200);
        Assert.assertTrue(locations.get(0).getName().contains("Konda Peta"));

        new APILogger().log("Location details with name is obtained --");

    }

    @Test
    public void getAllLocationNames() throws IOException{

        Response response = new PGRComplaintResource().getAllLocationNames();

        List<LocationNameResponse> locations = getResponseObjectArray(response);
        Assert.assertEquals(response.getStatusCode() , 200);
        new APILogger().log("All Location details with name is obtained --");

    }

    private List<LocationNameResponse> getResponseObjectArray(Response response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return mapper.readValue(response.asString(), new TypeReference<ArrayList<LocationNameResponse>>() {
        });
    }
}
