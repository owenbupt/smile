//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package smile;

import inet.linklayer.contract.IWirelessNic;
import inet.networklayer.common.InterfaceTable;
import inet.networklayer.generic.GenericRoutingTable;
import inet.mobility.contract.IMobility;

module RadioNode like IRadioNode
{
    parameters:
        @networkNode();
        @display("i=device/device");
        *.interfaceTableModule = default(absPath(".interfaceTable"));
        string physicalNicType = default("");
        string mobilityType = default("");
        string applicationType = default("");
        string clockType = default("");
        string nicDriverType = default("");
        string nicType = default("");

    gates:
        input radioIn @directIn;

    submodules:
        interfaceTable: InterfaceTable;
        routingTable: GenericRoutingTable;
        mobility: <mobilityType> like IMobility;
        application: <applicationType> like IApplication;
        clock: <clockType> like IClock;
        nicDriver: <nicDriverType> like IRangingNicDriver;
        nic: <nicType> like IWirelessNic;

    connections:
        radioIn --> nic.radioIn;
        nic.upperLayerIn <-- nicDriver.nicOut;
        nic.upperLayerOut --> nicDriver.nicIn;
        nicDriver.applicationOut --> application.in;
        nicDriver.applicationIn <-- application.out;
}
