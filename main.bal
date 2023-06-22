import ballerina/http;
import ballerina/log;

service / on new http:Listener(9091) {

    resource function get graduationinfo/[string id]() returns anydata|http:InternalServerError|error? {
        http:Client clientEp = check new ("https://api.sinclair.edu/portlet/api/");
        anydata|error response = clientEp->/graduationinfo/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }

        return response;
    }

    resource function get studentcommunications/[string id]() returns anydata|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/portlet/api/");
        anydata|error response = clientEp->/studentcommunications/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get person/[string id]() returns anydata|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        anydata|error response = clientEp->/person/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get faculty/[string id]() returns anydata|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        anydata|error response = clientEp->/faculty/[id].get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

    resource function get approvedcourses() returns anydata|http:InternalServerError|error?{
        http:Client clientEp = check new ("https://api.sinclair.edu/sdk/api/");
        anydata|error response = clientEp->/approvedcourses.get();
        if (response is error) {
            log:printError("Error from backend: ", err = response.message());
            return http:INTERNAL_SERVER_ERROR;
        }
        return response;
        
    }

}
