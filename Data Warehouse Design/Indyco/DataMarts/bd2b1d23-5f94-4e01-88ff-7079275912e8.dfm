<?xml version="1.0" encoding="UTF-8"?>
<graphml xmlns="http://iconsulting.biz/dfm"><graph id="G" edgedefault="directed" toolversion="3.2.5.0" factSchemaId="bd2b1d23-5f94-4e01-88ff-7079275912e8" name="flight_op" xmlns=""><node><data><Fact Name="flight_op" Description="Flight Operations Facts" Id="94e1372e-6b36-457a-8f82-254b8d74317a" X="530" Y="355" BackgroundColor="#FFFDEADA" Width="325" Height="205"><Measures><Measure Name="delay_minutes" Description="elapsed delay time in minutes" Note="precalculated value" Id="df017ef1-a190-48e2-bb0a-46cc6e68de1c"><Formula /></Measure><Measure Name="flight_hours" Description="time in minutes between takeoff and landing" Note="precalculated value" Id="eed73c0e-ec3b-46d1-bece-e75dde42f165"><Formula /></Measure><Measure Name="logbook_count_pilot" Id="876c49d1-f8bc-42c7-b7de-229c142dac9d"><Formula /><logicalModeling DbType="INT" /></Measure><Measure Name="logbook_count_maintenance" Note="precalculated value" Id="266771d2-66a1-446d-b816-227961fb9559"><Formula /><logicalModeling DbType="INT" /></Measure><Measure Name="cancellation_count" Id="85be644f-c2bd-4ae4-a1cc-e54044e70ed0"><Formula /><logicalModeling DbType="INT" /></Measure><Measure Name="delay_count" Description="Number of delays incurred" Note="precalculated value" Id="0360acce-f00f-4205-8739-feffb1f40020"><Formula /><logicalModeling DbType="INT" /></Measure><Measure Name="takeoff_count" Description="Number of succesful take offs" Note="precalculated value" Id="2300c2bd-1945-4f9b-a258-2fe78b57b1d1"><Formula /><logicalModeling DbType="INT" /></Measure></Measures><GroupsOfMeasures /></Fact></data></node><node><data><Attribute Name="registration_code" Description="" Id="22236c0a-ef26-40ea-82a6-4a7a864e6e18" X="586" Y="651" MasterId="00f03e20-4b1b-4bce-aaaa-a80c2e8022e2" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff" MasterHierarchyId="2bea988a-9a1f-4c94-bddc-5a22d29db12c" /></data></node><node><data><Attribute Name="model" Description="Aircraft model" Id="cb0b19cb-dae1-42a0-b0a2-990e9f3d7496" X="473" Y="824" MasterId="02e39d59-480c-4ae2-a0a5-8821f93cd55e" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff" MasterHierarchyId="2bea988a-9a1f-4c94-bddc-5a22d29db12c" /></data></node><node><data><Attribute Name="manufacturer" Description="Aircraft manufacturer" Id="661de196-47c0-4b5f-b412-7fe2b44a4e06" X="365" Y="975" MasterId="53e87c1d-854a-45de-8e8e-ab9f208a3613" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff" MasterHierarchyId="2bea988a-9a1f-4c94-bddc-5a22d29db12c" /></data></node><node><data><Attribute Name="flight_code" Description="" Id="e5727311-94cb-407e-bbef-3377d803e1c3" X="900" Y="377" MasterId="93a36743-36a3-403b-b256-4a15fb13183f" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" /></data></node><node><data><Attribute Name="pilot" Description="" Id="55feca02-493a-46c2-83a2-66722b8724eb" X="793" Y="272" MasterId="c1703a33-2a1c-45fd-a0d3-3b2832b14b5d" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" /></data></node><node><data><Attribute Name="maintenance_person" Description="Responsible for issuing maintenance reports during a flight&#xD;&#xA;" Id="13f7dff7-4570-4aab-b7c1-d247b43d64ba" X="1059" Y="234" MasterId="227e100f-e824-4f31-9612-74c04a462699" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" /></data></node><node><data><Attribute Name="airport" Description="" Id="7d2fb9c9-d4ca-4538-9173-5bfd390839b8" X="1156" Y="75" MasterId="48ad4b9c-09fb-431d-8c94-97c29ff035f9" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" /></data></node><node><data><Attribute Name="date_day" Description="A calendar day" Id="9b4abdfa-000c-4735-b148-0101afc6bc9c" X="413" Y="402" SampleValues="01-01-1990" MasterId="81cb35c8-99af-4831-811b-0e445104ebf6" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254"><logicalModeling DbType="VARCHAR" Length="255" /></Attribute></data></node><node><data><Attribute Name="calendar_month" Description="A calendar " Id="c5b7e978-bc9d-43b1-b145-05e4138a2381" X="221" Y="382" MasterId="2f92ddf8-eb22-43d4-b5c9-efca96807262" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254"><logicalModeling DbType="VARCHAR" Length="255" /></Attribute></data></node><node><data><Attribute Name="calendar_year" Description="" Id="4b2e8ba9-5c75-4fff-8eca-89a9805c5b21" X="42" Y="356" MasterId="8b8f1a58-976b-48d4-84bb-4b9993f6395a" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254"><logicalModeling DbType="VARCHAR" Length="255" /></Attribute></data></node><node><data><Attribute Name="day_name" Description="" Id="f188e310-cb6b-4c35-bcea-32a55b53c068" X="320" Y="407" IsDescriptive="true" SampleValues="MONDAY, TUESDAY, SUNDAY" MasterId="9e2ac2c4-f89e-463c-8b19-269df963bbe5" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254" /></data></node><edge id="5f3b7523-76c5-4075-a41c-62e11e50650a" source="94e1372e-6b36-457a-8f82-254b8d74317a" target="22236c0a-ef26-40ea-82a6-4a7a864e6e18" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff"><data><Arc /></data></edge><edge id="a94550c9-d846-4ae6-a5c0-5a68d4d58d2e" source="94e1372e-6b36-457a-8f82-254b8d74317a" target="e5727311-94cb-407e-bbef-3377d803e1c3" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf"><data><Arc /></data></edge><edge id="060ebfbc-8dda-41b0-8619-ae7d048ba19d" source="94e1372e-6b36-457a-8f82-254b8d74317a" target="9b4abdfa-000c-4735-b148-0101afc6bc9c" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f"><data><Arc /></data></edge><edge id="ddc715aa-56e6-49a3-be9f-0d8b6b6b77d5" source="22236c0a-ef26-40ea-82a6-4a7a864e6e18" target="cb0b19cb-dae1-42a0-b0a2-990e9f3d7496" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff" MasterHierarchyId="2bea988a-9a1f-4c94-bddc-5a22d29db12c" MasterId="620193a5-828f-4065-b5a2-24818d44ed64"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="3a67adad-4faa-44e0-9d2a-6054e879e265" source="cb0b19cb-dae1-42a0-b0a2-990e9f3d7496" target="661de196-47c0-4b5f-b412-7fe2b44a4e06" HierarchyId="d1d93144-ff71-4995-80a3-07122d1498ff" MasterHierarchyId="2bea988a-9a1f-4c94-bddc-5a22d29db12c" MasterId="845505c8-23d1-49e5-bed0-c344d106ce72"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="76019b5c-4af8-413b-b656-170cec1a195c" source="e5727311-94cb-407e-bbef-3377d803e1c3" target="55feca02-493a-46c2-83a2-66722b8724eb" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" MasterId="ba91e942-bf3d-4d06-a0d1-976b7a2a532b"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="06469c3d-9800-4790-9103-23d90526bcee" source="e5727311-94cb-407e-bbef-3377d803e1c3" target="13f7dff7-4570-4aab-b7c1-d247b43d64ba" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" MasterId="40323168-2ec5-453e-a13d-bbcdc991e4c4"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="f9c7d2a7-f00f-47b0-841a-fc677d67934e" source="13f7dff7-4570-4aab-b7c1-d247b43d64ba" target="7d2fb9c9-d4ca-4538-9173-5bfd390839b8" HierarchyId="3bcdf419-f0ec-498a-942e-727add40fbaf" MasterHierarchyId="5602cd80-10ff-41e8-bb11-1a41a45bae31" MasterId="d5d4d6c1-3a67-41a0-b2c9-2ac056e78de1"><data><Arc Role="works_at" IndexOfSameNodesLink="1" /></data></edge><edge id="d8ac07a2-3d35-423a-804b-aacb73e45790" source="9b4abdfa-000c-4735-b148-0101afc6bc9c" target="c5b7e978-bc9d-43b1-b145-05e4138a2381" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254" MasterId="06ab54a6-c4ef-4d78-bc6e-dab9f8ce1998"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="212989a4-dfc4-4648-ac91-6c62da51ffb2" source="c5b7e978-bc9d-43b1-b145-05e4138a2381" target="4b2e8ba9-5c75-4fff-8eca-89a9805c5b21" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254" MasterId="595dedce-2702-4eac-9fc2-5a8ab602ac42"><data><Arc IndexOfSameNodesLink="1" /></data></edge><edge id="546646cb-7ecf-4de8-a4f4-955cec552aee" source="9b4abdfa-000c-4735-b148-0101afc6bc9c" target="f188e310-cb6b-4c35-bcea-32a55b53c068" HierarchyId="670608b9-15de-4195-9b98-b0ab56b2b59f" MasterHierarchyId="11cd947c-0dfa-406c-9b26-a1e7ebef1254" MasterId="4c7d3eb0-9e4d-4d9b-9e8f-fb55ab55b165"><data><Arc IndexOfSameNodesLink="1" /></data></edge><hierarchy id="9e3a1c47-7a49-4ace-b0aa-b638947e7c21" rootArcId="5f3b7523-76c5-4075-a41c-62e11e50650a" name="registration_code" description="" note="" /><hierarchy id="9b7b1219-8820-460d-a8c9-22964acb59a6" rootArcId="a94550c9-d846-4ae6-a5c0-5a68d4d58d2e" name="flight_code" description="" note="" /><hierarchy id="a7450f2e-dc6b-429a-bc96-d0ad0f2545da" rootArcId="060ebfbc-8dda-41b0-8619-ae7d048ba19d" name="date_day" description="" note="" /></graph><additivityMatrix xmlns=""><item measureId="df017ef1-a190-48e2-bb0a-46cc6e68de1c" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="df017ef1-a190-48e2-bb0a-46cc6e68de1c" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="df017ef1-a190-48e2-bb0a-46cc6e68de1c" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="eed73c0e-ec3b-46d1-bece-e75dde42f165" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="eed73c0e-ec3b-46d1-bece-e75dde42f165" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="eed73c0e-ec3b-46d1-bece-e75dde42f165" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="876c49d1-f8bc-42c7-b7de-229c142dac9d" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="876c49d1-f8bc-42c7-b7de-229c142dac9d" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="876c49d1-f8bc-42c7-b7de-229c142dac9d" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="266771d2-66a1-446d-b816-227961fb9559" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="266771d2-66a1-446d-b816-227961fb9559" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="266771d2-66a1-446d-b816-227961fb9559" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="85be644f-c2bd-4ae4-a1cc-e54044e70ed0" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="85be644f-c2bd-4ae4-a1cc-e54044e70ed0" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="85be644f-c2bd-4ae4-a1cc-e54044e70ed0" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="0360acce-f00f-4205-8739-feffb1f40020" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="0360acce-f00f-4205-8739-feffb1f40020" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="0360acce-f00f-4205-8739-feffb1f40020" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item><item measureId="2300c2bd-1945-4f9b-a258-2fe78b57b1d1" hierarchyId="9e3a1c47-7a49-4ace-b0aa-b638947e7c21"><operator id="Sum" /></item><item measureId="2300c2bd-1945-4f9b-a258-2fe78b57b1d1" hierarchyId="9b7b1219-8820-460d-a8c9-22964acb59a6"><operator id="Sum" /></item><item measureId="2300c2bd-1945-4f9b-a258-2fe78b57b1d1" hierarchyId="a7450f2e-dc6b-429a-bc96-d0ad0f2545da"><operator id="Sum" /></item></additivityMatrix></graphml>