import ballerina/http;
import ballerina/log;

service /customcollegeapi on new http:Listener(9092) {

    resource function get graduationinfo/[string id]() returns json|http:InternalServerError|error? {
        http:Client clientEp = check new ("https://api.sinclair.edu/portlet/api/");
        json|error response = clientEp->/graduationinfo/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }

        return response;
    }

    resource function get studentcommunications/[string id]() returns json|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/portlet/api/");
        json|error response = clientEp->/studentcommunications/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get person/[string id]() returns json|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        json|error response = clientEp->/person/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get faculty/[string id]() returns json|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        json|error response = clientEp->/faculty/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get approvedcourses() returns json|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        json|error response = clientEp->/approvedcourses.get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

}
