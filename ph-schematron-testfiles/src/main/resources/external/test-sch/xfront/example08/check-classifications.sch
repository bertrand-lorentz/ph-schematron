<?xml version="1.0"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

   <sch:pattern>

      <sch:p>A Para's classification value cannot be more sensitive 
                than the Document's classification value.</sch:p> 

      <sch:rule context="Para[@classification='top-secret']">

         <sch:assert test="/Document/@classification='top-secret'">
             If there is a Para labeled "top-secret" then the Document  
             should be labeled top-secret
         </sch:assert>

      </sch:rule>

      <sch:rule context="Para[@classification='secret']">

         <sch:assert test="(/Document/@classification='top-secret') or
                           (/Document/@classification='secret')">
             If there is a Para labeled "secret" then the Document  
             should be labeled either secret or top-secret
         </sch:assert>

      </sch:rule>

      <sch:rule context="Para[@classification='confidential']">

         <sch:assert test="(/Document/@classification='top-secret') or
                           (/Document/@classification='secret') or 
                           (/Document/@classification='confidential')">
             If there is a Para labeled "confidential" then the Document  
             should be labeled either confidential, secret or top-secret
         </sch:assert>

      </sch:rule>

   </sch:pattern>

</sch:schema>