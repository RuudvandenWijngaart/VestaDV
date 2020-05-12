<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:esdl="http://www.tno.nl/esdl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="" description="" id="7a59e314-e3e3-40da-905c-7a4ce0606ac1">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="442ba23d-90ba-43b2-97c7-910d8a656a8a">
    <area xsi:type="esdl:Area" id="4c3fd4bb-1b3e-4959-a365-ec749d863ef9" name="Untitled area">
      <area xsi:type="esdl:Area" id="c3529e7c-baf1-43aa-96f5-26e6ce9a7908" name="Area_c352">
        <area xsi:type="esdl:Area" id="6c6c54cf-67af-4feb-abbe-9e3ebab16481" name="Area_6c6c">
          <geometry xsi:type="esdl:Polygon" CRS="WGS84">
            <exterior xsi:type="esdl:SubPolygon">
              <point xsi:type="esdl:Point" lon="4.861621856689453" lat="52.41205322263206"/>
              <point xsi:type="esdl:Point" lon="4.854927062988281" lat="52.405665465644226"/>
              <point xsi:type="esdl:Point" lon="4.864883422851563" lat="52.401266800143915"/>
              <point xsi:type="esdl:Point" lon="4.874324798583985" lat="52.405351289795185"/>
            </exterior>
          </geometry>
        </area>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="4.818706512451173" lat="52.3915253372322"/>
            <point xsi:type="esdl:Point" lon="4.838619232177735" lat="52.39288717639075"/>
            <point xsi:type="esdl:Point" lon="4.875526428222657" lat="52.42503531994297"/>
            <point xsi:type="esdl:Point" lon="4.886684417724609" lat="52.42587274336118"/>
            <point xsi:type="esdl:Point" lon="4.890975952148438" lat="52.4221042127019"/>
            <point xsi:type="esdl:Point" lon="4.877243041992188" lat="52.41896352440069"/>
            <point xsi:type="esdl:Point" lon="4.874324798583985" lat="52.41571791145836"/>
            <point xsi:type="esdl:Point" lon="4.891319274902345" lat="52.40639853392399"/>
            <point xsi:type="esdl:Point" lon="4.879989624023438" lat="52.38702049295587"/>
            <point xsi:type="esdl:Point" lon="4.8183631896972665" lat="52.38429641058654"/>
          </exterior>
        </geometry>
      </area>
      <asset xsi:type="esdl:Building" energyLabel="LABEL_B" name="Building_7fb2" id="7fb293bb-8170-4ab9-8267-9f17c473030c" aggregated="true" residentialBuildingType="APPARTEMENT" numberOfFloors="4" buildingYear="1980" aggregationCount="329">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.866943359375" lat="52.40734103238399"/>
        <asset xsi:type="esdl:GasHeater" name="GasHeater_6a59" id="6a59fb43-6d17-4547-9915-3fede2b8ff47" type="VR">
          <geometry xsi:type="esdl:Point" lon="213.0" lat="345.0"/>
          <port xsi:type="esdl:InPort" connectedTo="d7d9efc0-5288-4ccf-a771-8872362e0c48" name="In" id="77eb6371-5a36-4546-b2c8-df92e6a4a9da"/>
          <port xsi:type="esdl:OutPort" connectedTo="25a73d09-1ed4-4fcc-b028-3cb5d2b4da42 b199c03c-7498-462e-9f67-7aa190854783" name="Out" id="a0c47642-403d-466b-ac4e-cd7e4f5b15af"/>
        </asset>
        <asset xsi:type="esdl:HeatPump" name="HeatPump_b3fa" id="b3fa8f6b-1272-4a1e-ba3f-9c4555d89be3" power="3000.0">
          <geometry xsi:type="esdl:Point" lon="212.0" lat="226.0"/>
          <port xsi:type="esdl:InPort" connectedTo="d168ce5c-d245-4b6b-85cd-e5165abea902" name="In" id="fc69ddf3-54c5-47d1-a00a-58ad34192d84"/>
          <port xsi:type="esdl:OutPort" connectedTo="25a73d09-1ed4-4fcc-b028-3cb5d2b4da42 b79a1e0a-f279-497d-969a-a719ff9be21a" name="Out" id="a0fc7d2f-364c-4f1a-9b4d-55c25a07770a"/>
          <costInformation xsi:type="esdl:CostInformation">
            <marginalCosts xsi:type="esdl:SingleValue" id="b4a34900-28ef-40b8-98f5-3efa08b00678" value="2.0" name="HeatPump_b3fa-MarginalCosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" power="10000.0" name="HeatingDemand_5b7e" id="5b7e7652-3945-4677-91ec-114b2eeb4b54" type="SPACE_HEATING">
          <geometry xsi:type="esdl:Point" CRS="Simple" lon="379.0" lat="350.78125"/>
          <port xsi:type="esdl:InPort" connectedTo="a0c47642-403d-466b-ac4e-cd7e4f5b15af a0fc7d2f-364c-4f1a-9b4d-55c25a07770a" name="In" id="25a73d09-1ed4-4fcc-b028-3cb5d2b4da42"/>
        </asset>
        <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_848c" id="848ce122-759b-4bc4-8b62-1c3b14d4916d">
          <geometry xsi:type="esdl:Point" CRS="Simple" lon="383.0" lat="263.78125"/>
          <port xsi:type="esdl:InPort" connectedTo="a0fc7d2f-364c-4f1a-9b4d-55c25a07770a" name="In" id="b79a1e0a-f279-497d-969a-a719ff9be21a"/>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_37f7" id="37f71eb9-b148-46dd-a906-769efd788d2d" type="HOT_TAPWATER">
          <geometry xsi:type="esdl:Point" CRS="Simple" lon="390.0" lat="421.78125"/>
          <port xsi:type="esdl:InPort" connectedTo="a0c47642-403d-466b-ac4e-cd7e4f5b15af" name="In" id="b199c03c-7498-462e-9f67-7aa190854783"/>
        </asset>
        <asset xsi:type="esdl:GConnection" name="GConnection_c268" id="c26872d5-dbf6-44a0-9dff-3379db1d3357">
          <geometry xsi:type="esdl:Point" CRS="Simple" lon="63.0" lat="350.78125"/>
          <port xsi:type="esdl:InPort" name="In" id="dee3bd0c-c8b1-4d33-bb1e-1750e1793007"/>
          <port xsi:type="esdl:OutPort" connectedTo="77eb6371-5a36-4546-b2c8-df92e6a4a9da" name="Out" id="d7d9efc0-5288-4ccf-a771-8872362e0c48"/>
        </asset>
        <asset xsi:type="esdl:EConnection" name="EConnection_f6da" id="f6da0ab7-c56f-4e65-b0a7-c5b75c9a75a3">
          <geometry xsi:type="esdl:Point" CRS="Simple" lon="61.0" lat="224.78125"/>
          <port xsi:type="esdl:InPort" name="In" id="03ff77bf-4cb9-43aa-a5b9-67765f1468b4"/>
          <port xsi:type="esdl:OutPort" connectedTo="fc69ddf3-54c5-47d1-a00a-58ad34192d84" name="Out" id="d168ce5c-d245-4b6b-85cd-e5165abea902"/>
        </asset>
      </asset>
      <asset xsi:type="esdl:Building" energyLabel="LABEL_A" name="Building_e86b" id="e86b3300-1b19-4339-aba3-af86363a4379" residentialBuildingType="APPARTEMENT" numberOfFloors="3" buildingYear="2030" aggregationCount="1345" floorArea="20000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.860591888427735" lat="52.40592727714254"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
