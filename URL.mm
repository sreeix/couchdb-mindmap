<map version="0.7.1">
<node TEXT="URL">
<node TEXT="http://127.0.0.1:5984/pomodoro" POSITION="right"/>
<node TEXT="Design Documents" POSITION="left">
<node TEXT="http://127.0.1.1:5984/&lt;db_name&gt;/_design/&lt;design_name&gt;&gt;">
<node TEXT="Create">
<node TEXT="curl -X PUT http://127.0.0.1:5984/albums/_design/example -d @mydesign.json"/>
</node>
<node TEXT="Get">
<node TEXT="curl -X GET http://127.0.0.1:5984/albums/_design/example"/>
</node>
<node TEXT="Update">
<node TEXT="curl -X PUT http://127.0.0.1:5984/albums/_design/example -d @mydesign.json"/>
</node>
<node TEXT="Delete ">
<node TEXT="curl -X DELETE http://127.0.0.1:5984/albums/_design/example"/>
</node>
</node>
</node>
<node TEXT="server" POSITION="left">
<node TEXT="http://127.0.0.1:5984/"/>
</node>
<node TEXT="database" POSITION="right">
<node TEXT="http://127.0.0.1:5984/&lt;database_name&gt;">
<node TEXT="Create">
<node TEXT="curl -vX PUT http://127.0.0.1:5984/albums"/>
</node>
<node TEXT="Delete">
<node TEXT="curl -vX PUT http://127.0.0.1:5984/albums"/>
</node>
<node TEXT="Get">
<node TEXT="curl  http://127.0.0.1:5984/albums"/>
</node>
<node TEXT="List">
<node LINK="http://127.0.0.1:5984/_all_dbs" TEXT="curl -X GET http://127.0.0.1:5984/_all_dbs"/>
</node>
</node>
</node>
<node TEXT="Documents" FOLDED="true" POSITION="right">
<node TEXT="http://127.0.0.1:5984/&lt;database&gt;/&lt;document_id&gt;">
<node TEXT="Get">
<node TEXT="curl -X GET http://127.0.0.1:5984/albums/6e1295ed6c29495e54cc05947f18c8af"/>
</node>
<node TEXT="Create">
<node TEXT="curl -X PUT http://127.0.0.1:5984/albums/6e1295ed6c29495e54cc05947f18c8af -d &apos;{&quot;title&quot;:&quot;There is Nothing Left to Lose&quot;,&quot;artist&quot;:&quot;Foo Fighters&quot;}&apos;"/>
<node TEXT="curl -X POST http://127.0.0.1:5984/albums/ -d &apos;{&quot;title&quot;:&quot;There is Nothing Left to Lose&quot;,&quot;artist&quot;:&quot;Foo Fighters&quot;}&apos;"/>
<node TEXT="Note the diff between post and put. you could use a specific id with put"/>
</node>
<node TEXT="Update">
<node TEXT="curl -X PUT http://127.0.0.1:5984/albums/6e1295ed6c29495e54cc05947f18c8af -d &apos;{&quot;title&quot;:&quot;There is Nothing Left to Lose&quot;,&quot;artist&quot;:&quot;Foo Fighters&quot;}&apos;"/>
</node>
<node TEXT="Delete">
<node TEXT="curl -X DELETE http://127.0.0.1:5984/albums/6e1295ed6c29495e54cc05947f18c8af"/>
</node>
<node TEXT="List">
<node TEXT="http://127.0.0.1:5984/albums/_all_docs"/>
</node>
</node>
<node TEXT="All Documents">
<node TEXT="http://127.0.0.1:5984/albums/_all_docs">
<node TEXT="curl &apos;http://127.0.0.1:5984/foo/_all_docs?include_docs=true&amp;startkey=&quot;ba&quot;&amp;endkey=&quot;bb&quot;&apos; "/>
</node>
<node TEXT="Post on _all_docs">
<node TEXT="Will get you arbitrary keys">
<node TEXT="curl -d &apos;{&quot;keys&quot;:[&quot;bar&quot;,&quot;baz&quot;]}&apos; -X POST http://127.0.0.1:5984/foo/_all_docs?include_docs=true "/>
</node>
</node>
</node>
</node>
<node TEXT="Replication" POSITION="left">
<node TEXT="http://127.0.0.1:5984/_replicate">
<node TEXT="Replicate">
<node TEXT="curl -vX POST http://127.0.0.1:5984/_replicate -d &apos;{&quot;source&quot;:&quot;albums&quot;,&quot;target&quot;:&quot;albums-replica&quot;}&apos;"/>
</node>
</node>
</node>
<node TEXT="View" POSITION="right">
<node TEXT="http://127.0.0.1:5984/albums/_design/docs_by_date/_view/by_type"/>
</node>
<node TEXT="Bulk Changes" POSITION="left">
<node TEXT="Post">
<node TEXT="curl -v -d &apos;{&quot;docs&quot;:[{&quot;key&quot;:&quot;baz&quot;,&quot;name&quot;:&quot;bazzel&quot;,_rev=&quot;xxxx&quot;},{&quot;key&quot;:&quot;bar&quot;,&quot;name&quot;:&quot;barry&quot;, _rev=&quot;xxxx&quot;}]}&apos; -X POST $DB/_bulk_docs "/>
<node TEXT="_deleted on the doc would delete the documents"/>
</node>
</node>
</node>
</map>
