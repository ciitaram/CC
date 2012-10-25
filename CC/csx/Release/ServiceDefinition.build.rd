<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="CC" generation="1" functional="0" release="0" Id="a436b677-3741-444a-9f65-c9dfa5df8623" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="CCGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WebRole1:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/CC/CCGroup/LB:WebRole1:Endpoint1" />
          </inToChannel>
        </inPort>
        <inPort name="WebRole1:SSL" protocol="https">
          <inToChannel>
            <lBChannelMoniker name="/CC/CCGroup/LB:WebRole1:SSL" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|WebRole1:SSL" defaultValue="">
          <maps>
            <mapMoniker name="/CC/CCGroup/MapCertificate|WebRole1:SSL" />
          </maps>
        </aCS>
        <aCS name="WebRole1:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/CC/CCGroup/MapWebRole1:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/CC/CCGroup/MapWebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/CC/CCGroup/MapWebRole1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WebRole1:Endpoint1">
          <toPorts>
            <inPortMoniker name="/CC/CCGroup/WebRole1/Endpoint1" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:WebRole1:SSL">
          <toPorts>
            <inPortMoniker name="/CC/CCGroup/WebRole1/SSL" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapCertificate|WebRole1:SSL" kind="Identity">
          <certificate>
            <certificateMoniker name="/CC/CCGroup/WebRole1/SSL" />
          </certificate>
        </map>
        <map name="MapWebRole1:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/CC/CCGroup/WebRole1/DataConnectionString" />
          </setting>
        </map>
        <map name="MapWebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/CC/CCGroup/WebRole1/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWebRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/CC/CCGroup/WebRole1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WebRole1" generation="1" functional="0" release="0" software="E:\Programming\C#\Cloud\CC\CC\csx\Release\roles\WebRole1" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
              <inPort name="SSL" protocol="https" portRanges="443">
                <certificate>
                  <certificateMoniker name="/CC/CCGroup/WebRole1/SSL" />
                </certificate>
              </inPort>
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WebRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WebRole1&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;SSL&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0SSL" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/CC/CCGroup/WebRole1/SSL" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="SSL" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/CC/CCGroup/WebRole1Instances" />
            <sCSPolicyFaultDomainMoniker name="/CC/CCGroup/WebRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="WebRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WebRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="19fdf4c5-3647-497f-891b-eb04e3355999" ref="Microsoft.RedDog.Contract\ServiceContract\CCContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="6be05f85-e451-484f-81cf-4538d04479ab" ref="Microsoft.RedDog.Contract\Interface\WebRole1:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/CC/CCGroup/WebRole1:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="8c266785-8595-4106-89b4-7f3fc21ea4b6" ref="Microsoft.RedDog.Contract\Interface\WebRole1:SSL@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/CC/CCGroup/WebRole1:SSL" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>