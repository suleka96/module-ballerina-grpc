// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;

listener Listener ep26 = new (9116);

@ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_26,
    descMap: getDescriptorMap26()
}
service "HelloWorld26" on ep26 {

    remote isolated function lotsOfGreetings(stream<string,error> clientStream) returns string {
        log:printInfo("connected sucessfully.");
        error? e = clientStream.forEach(isolated function(string name) {
            log:printInfo("greet received: " + name);
        });
        if (e is EosError) {
            return "Ack";
        }
        return "";
    }
}


const string ROOT_DESCRIPTOR_26 = "0A2532365F72657475726E5F646174615F636C69656E745F73747265616D696E672E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F325F0A0C48656C6C6F576F726C643236124F0A0F6C6F74734F664772656574696E6773121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801620670726F746F33";
isolated function getDescriptorMap26() returns map<string> {
    return {
        "26_return_data_client_streaming.proto":"0A2532365F72657475726E5F646174615F636C69656E745F73747265616D696E672E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F325F0A0C48656C6C6F576F726C643236124F0A0F6C6F74734F664772656574696E6773121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C7565427C0A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A2A6769746875622E636F6D2F676F6C616E672F70726F746F6275662F7074797065732F7772617070657273F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"

    };
}

