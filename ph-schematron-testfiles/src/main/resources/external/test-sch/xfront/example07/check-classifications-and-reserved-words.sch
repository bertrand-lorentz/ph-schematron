<?xml version="1.0"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

   <sch:phase id="classificationValidation">

      <sch:p>Validate that the document's security classification policy is valid.</sch:p>

       <sch:active pattern="SCP" />

   </sch:phase>

   <sch:phase id="reservedWordValidation">

      <sch:p>Validate that the document doesn't contain any reserved words.</sch:p>

       <sch:active pattern="RWF" />

   </sch:phase>

   <sch:pattern id="SCP">

      <sch:p>A Para's classification value cannot be more sensitive 
         than the Document's classification value.</sch:p> 

      <sch:rule context="Para[@classification='top-secret']">

         <sch:assert test="/Document/@classification='top-secret'">
             If there is a Para is labeled "top-secret" then the Document  
             should be labeled top-secret
         </sch:assert>

      </sch:rule>

      <sch:rule context="Para[@classification='secret']">

         <sch:assert test="(/Document/@classification='top-secret') or
                           (/Document/@classification='secret')">
             If there is a Para is labeled "secret" then the Document  
             should be labeled either secret or top-secret
         </sch:assert>

      </sch:rule>

      <sch:rule context="Para[@classification='confidential']">

         <sch:assert test="(/Document/@classification='top-secret') or
                           (/Document/@classification='secret') or 
                           (/Document/@classification='confidential')">
             If there is a Para is labeled "confidential" then the Document  
             should be labeled either confidential, secret or top-secret
         </sch:assert>

      </sch:rule>

   </sch:pattern>

   <sch:pattern id="RWF">

      <sch:p>These reserved words are not allowed anywhere in the
         document: SCRIPT, FUNCTION.</sch:p> 

      <sch:rule context="Document">

         <sch:assert test="count(//node()[contains(.,'SCRIPT')]) = 0
                           and
                           count(//node()[contains(.,'FUNCTION')]) = 0">
             The document must not contain the words SCRIPT or FUNCTION
         </sch:assert>

      </sch:rule>

   </sch:pattern>

</sch:schema>