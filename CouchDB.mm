<map version="0.7.1">
<node TEXT="CouchDB">
<node TEXT="Disruptive" FOLDED="true" POSITION="right">
<node TEXT="Schema Free" FOLDED="true">
<node TEXT="Only _id and _rev"/>
<node TEXT="Otherwise free to add modify schema">
<node TEXT="If you are not modifying you are doing it wrong"/>
<node TEXT="Changed my schema for dates atleast 3 times"/>
</node>
</node>
<node TEXT="JSON Documents for storage" FOLDED="true">
<node TEXT="Non Proprietry format">
<node TEXT="Unlike Oracle"/>
<node TEXT="Unlike Object Database"/>
<node TEXT="Unlike Neo4J"/>
<node TEXT="Unlike DHT"/>
</node>
<node TEXT="MVCS">
<node TEXT="Dramatically simplifies Synchronization"/>
<node TEXT="Removes need for locking" FOLDED="true">
<node TEXT="Eventually Consistent"/>
<node TEXT="Does not lock to wait for writers">
<node TEXT="Gives the older version"/>
<node TEXT="Muliple Writers cause Conflict"/>
</node>
</node>
</node>
<node TEXT="Piece of Cake full text search"/>
</node>
<node TEXT="Embraces REST and HTTP" FOLDED="true">
<node TEXT="Refresher">
<node TEXT="Get  Retrives the resource representation"/>
<node TEXT="Post Creates a Resource given a representation"/>
<node TEXT="PUT Updates a resource with the new represenation"/>
<node TEXT="Delete Deletes the resource"/>
</node>
<node TEXT="Every thing is resful">
<node TEXT="Database"/>
<node TEXT="Views"/>
<node TEXT="Documents"/>
<node TEXT="Replication"/>
</node>
<node TEXT="Everybody know the API"/>
<node TEXT="Caveat">
<node TEXT="Not Railsy">
<node TEXT="Does not support Get on /foo/"/>
</node>
<node TEXT="Also does not do HAEOAS(Hypertext as An Engine of Application state)"/>
</node>
<node TEXT="ETAGS for everything"/>
</node>
<node TEXT="Self Contained Data" FOLDED="true">
<node TEXT="Flattend for Completeness">
<node TEXT="Unlike Relational DB">
<node TEXT="Where focus is on storage and lock optimization"/>
</node>
<node TEXT="All Contact Information is in the same document">
<node TEXT="Some Contacts may have No Fax number"/>
<node TEXT="Some contacts can have 5 Addresses"/>
</node>
<node TEXT="No Joins"/>
<node TEXT="No Transactions"/>
<node TEXT="No Locks to access data"/>
</node>
</node>
<node TEXT="Simple Custering and Replication">
<node TEXT="Inpired by Lotus Notes"/>
<node TEXT="Incremental Replication"/>
<node TEXT="Designed for offline support"/>
</node>
<node TEXT="Simplifies Web development" FOLDED="true">
<node TEXT="Cuts the boiler Plate Code.."/>
<node TEXT="No Need to have a middle tier">
<node TEXT="Browser calls Database Straight up"/>
</node>
</node>
</node>
<node TEXT="CAP Theorem" POSITION="left">
<node TEXT="Consistency"/>
<node TEXT="Availability"/>
<node TEXT="Partition Tolerance"/>
<node TEXT="Choose only Two" FOLDED="true">
<node TEXT="C-A">
<node TEXT="SQL DBS"/>
<node TEXT="Bigtable" FOLDED="true">
<node TEXT="Replication comes from GFS"/>
<node TEXT="HBASE"/>
</node>
</node>
<node TEXT="A-P">
<node TEXT="Couch"/>
<node TEXT="Linkedin&apos;s Voldemort"/>
<node TEXT="Amazon&apos;s Dynmo"/>
</node>
<node TEXT="C-P">
<node TEXT="RDBMS"/>
</node>
<node TEXT="Facebook&apos;s Cassandra">
<node TEXT="Explicit Replication">
<node TEXT="Like Bigtable"/>
</node>
<node TEXT="Eventually Consistent">
<node TEXT="Like CouchDb"/>
</node>
<node TEXT="Highly available"/>
</node>
</node>
<node LINK="http://www.julianbrowne.com/article/viewer/brewers-cap-theorem" TEXT="http://www.julianbrowne.com/article/viewer/brewers-cap-theorem"/>
</node>
<node TEXT="The Real Thing" POSITION="right">
<node TEXT="Futon">
<node TEXT="Browser based db administration"/>
<node TEXT="Hard to Edit Json">
<node TEXT="No Validation"/>
</node>
</node>
<node TEXT="Http client/Rest client from code"/>
<node TEXT="Curl">
<node TEXT="Easier">
<node TEXT="Remember to urlencode the url">
<node TEXT="Spent a couple of hours trying to figure out why couch was not returning the results"/>
</node>
</node>
<node TEXT="Harder to remember the syntax"/>
</node>
<node TEXT="Old tricks to old dog" FOLDED="true">
<node TEXT="select *"/>
<node TEXT="Count *"/>
</node>
<node TEXT="Concepts">
<node TEXT="Design Documents">
<node TEXT="Application" FOLDED="true">
<node TEXT="Can be many for a given Database">
<node TEXT="Admin Users/Normal User"/>
<node TEXT="Blog Readers/Blog Editors"/>
</node>
<node TEXT="Again Inspired by Lotus Nots"/>
<node TEXT="Contains Metadata for the App">
<node TEXT="Views">
<node TEXT="Map Reduce Queries"/>
</node>
<node TEXT="Validations"/>
<node TEXT="Shows" FOLDED="true">
<node TEXT="Transformations to specific content types"/>
</node>
<node TEXT="Attachments" FOLDED="true">
<node TEXT="Raw Images"/>
<node TEXT="CSS"/>
<node TEXT="Javascript"/>
<node TEXT="Static Html"/>
</node>
<node TEXT="Library Code..."/>
<node TEXT="Signatures for Deployment"/>
</node>
<node TEXT="Json Document">
<node TEXT="Replicates as Usual"/>
<node TEXT="Has ID and Revision"/>
</node>
</node>
</node>
<node TEXT="Views">
<node TEXT="Temporaty Views" FOLDED="true">
<node TEXT="Just for testing"/>
<node TEXT="Not Replicated"/>
</node>
<node TEXT="Permanent Views" FOLDED="true">
<node TEXT="Are placed in Design Document"/>
</node>
<node TEXT="Map Reduce">
<node TEXT="A way of distributing data for large datasets">
<node TEXT="Master Slave Scheme">
<node TEXT="Master breakes the problem into pieces"/>
<node TEXT="map creates a set of key value pairs"/>
<node TEXT="Master collects all the key value pairs"/>
<node TEXT="Groups by the key"/>
<node TEXT="And calls reduce with the key and the grouped values"/>
<node TEXT="Master groups all the results"/>
<node TEXT="Canonical Example of Map reduce(google paper) is Word counts in documents"/>
</node>
</node>
<node TEXT="Map does Select" FOLDED="true">
<node TEXT="Select *"/>
<node COLOR="#669900" TEXT="function(doc) {   if(doc.date &amp;&amp; doc.title) {     emit(doc.date, doc.title);   } }"/>
</node>
<node TEXT="Reduce Does Crunching" FOLDED="true">
<node TEXT="Count*"/>
<node COLOR="#cc6600" TEXT="function (key, values, rereduce) {     return sum(values); }"/>
<node TEXT="Rereduce?">
<node TEXT="Optimisation">
<node TEXT="Used for large batches of data"/>
</node>
</node>
<node TEXT="It is optional"/>
</node>
</node>
<node TEXT="Example">
<node TEXT="GET /some_database/_design/company/_view/all">
<node TEXT="group"/>
<node TEXT="limit"/>
<node TEXT="include_docs"/>
<node TEXT="key"/>
<node TEXT="startKey"/>
<node TEXT="endKey"/>
<node TEXT="ascending"/>
</node>
<node TEXT="Remember to Url encode when making request">
<node TEXT="All take JSON Requests">
<node TEXT="key=[1,3,4]"/>
</node>
</node>
</node>
</node>
<node TEXT="Query Server" FOLDED="true">
<node TEXT="What language to write map reduce?"/>
<node TEXT="Default Javascript"/>
<node TEXT="Native actually is erlang(needs to be enabled manually)"/>
<node TEXT="Others available" FOLDED="true">
<node TEXT="Lisp"/>
<node TEXT="Ruby"/>
<node TEXT="Perl"/>
<node TEXT="Python"/>
<node TEXT="Erlang"/>
<node TEXT="Sorry Static languages"/>
</node>
</node>
<node TEXT="Validation" FOLDED="true">
<node TEXT="Javascript function returning true or false" FOLDED="true">
<node COLOR="#006633" TEXT="function(newDoc, oldDoc, userCtx) { "/>
</node>
<node TEXT="Interesting DSL to do validation" FOLDED="true">
<node TEXT="require &apos;foo&apos;"/>
<node TEXT="throw({forbidden : &quot;Can&apos;t change field&quot;}); "/>
<node TEXT="throw({unauthorized : message});"/>
<node TEXT="unchanged(&apos;author&apos;)"/>
<node TEXT="CouchDB&#x2019;s JavaScript runtime&#x2019;s built-in toJSON function">
<node TEXT="Rather than javascripts"/>
</node>
<node TEXT=" enforce(newDoc.author == userCtx.name, &quot;Has to be the same user&quot;)"/>
</node>
</node>
<node TEXT="Shows" FOLDED="true">
<node TEXT="Allows Rendering of Custom Page" FOLDED="true">
<node TEXT="Almost like Rack/Sinatra"/>
<node COLOR="#006633" TEXT="function(doc, req) { ">
<node TEXT="Returns a Hash of Response(headers,body,etags etal)"/>
</node>
<node COLOR="#cc6600" TEXT="GET /mydb/_design/mydesign/_show/myshow/72d43a93eb74b5f2"/>
<node TEXT="Supports Templates for the shows"/>
</node>
</node>
<node TEXT="Lists">
<node TEXT="Don&apos;t Understand much."/>
</node>
<node TEXT="Notifications" FOLDED="true">
<node TEXT="_changes"/>
<node TEXT="Polling">
<node TEXT="Sucks"/>
</node>
<node TEXT="Long Poll" FOLDED="true">
<edge WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node TEXT="Client Creates a connection"/>
<node TEXT="Closes Connection if an update arrives"/>
<node TEXT="Server keeps the connection open till there are changes"/>
<node TEXT="Sends the changes an closes connection"/>
<node TEXT="Client Reconnects back again and repeats"/>
<node COLOR="#338800" TEXT="_changes?feed=longpoll&amp;since=2"/>
<node TEXT="Sucks better"/>
</node>
<node TEXT="Continous" FOLDED="true">
<node TEXT="Http Keepalive"/>
<node COLOR="#cc6600" TEXT="_changes?feed=continuous&amp;since=3"/>
</node>
<node TEXT="Posting Changes to the url is not supported">
<icon BUILTIN="button_cancel"/>
</node>
</node>
</node>
<node TEXT="The code"/>
<node TEXT="Modelling" FOLDED="true">
<node TEXT="Blogs">
<node TEXT="Posts and comments are in same document"/>
<node TEXT="Different Documents differentiated by type"/>
</node>
</node>
</node>
<node TEXT="Frameworks" FOLDED="true" POSITION="left">
<node TEXT="Rails/Ruby" FOLDED="true">
<node TEXT="Mostly provide AR style mapping">
<node TEXT="Disbelive them">
<node TEXT="Stay Close to the Bare metal"/>
<node TEXT="Better off start with a simple Rest Client">
<node TEXT="Wrest(sidu)"/>
<node TEXT="Httparty"/>
<node TEXT="RestClient"/>
</node>
<node TEXT="Better stick to the restful interfaces to couch"/>
</node>
<node TEXT="Typically No Finders"/>
<node TEXT="Support Associations">
<node TEXT="Really, Does Couch DB????"/>
</node>
</node>
<node TEXT="http://ruby-toolbox.com/categories/couchdb_clients.html"/>
</node>
<node TEXT="Couchapp">
<node TEXT="Like Squeak for Couchapps( Database is the app server)">
<node TEXT="Check in code to CouchDb">
<node TEXT="View Templates"/>
<node TEXT="Java Script"/>
<node TEXT="CSS"/>
<node TEXT="Static Html"/>
<node TEXT="Images"/>
</node>
<node TEXT="Deploy from couchdb"/>
<node TEXT="Do git diffs in the couch app">
<node TEXT="Because It is a version Control as well as a datbase"/>
</node>
</node>
</node>
<node TEXT="Browser Couch">
<node TEXT="CouchDB semantics over sqlite3 in firefox"/>
<node TEXT="No SQL in HTML5">
<node TEXT="HTML5 may standardize sqlite for browsers"/>
</node>
</node>
<node TEXT="jQCouch">
<node TEXT="Jquery plugin to deal with Couchdb"/>
</node>
</node>
<node TEXT="More..." FOLDED="true" POSITION="left">
<node TEXT="Clustering Scenarios"/>
<node TEXT="Offline support"/>
</node>
<node TEXT="Would you trust the Couch?" FOLDED="true" POSITION="right">
<node TEXT="Concurrency">
<node TEXT="Optimistic"/>
<node TEXT="No Locks">
<node TEXT="Massive Performance boosts">
<node TEXT="Most RDBMS spend time managing locks rather than querying"/>
</node>
</node>
</node>
<node TEXT="Transactions">
<node TEXT="WTF?"/>
<node TEXT="Remember documents are complete on their own"/>
<node TEXT="Remember there are no transactions on the web"/>
<node TEXT="Single Writes are atomic"/>
<node TEXT="Create a reversing transaction on failure"/>
</node>
<node TEXT="Refactoring">
<node TEXT="Slightly Harder">
<node TEXT="Same as implementing stuff in database"/>
<node TEXT="Thoughts"/>
</node>
<node TEXT="Not Hard to implement because it is OPEN"/>
</node>
<node TEXT="testing">
<node TEXT="Simple"/>
<node TEXT="End to end"/>
</node>
<node TEXT="Robust">
<node TEXT="Write only Btree"/>
<node TEXT="No caching or delayed consistency algos"/>
<node TEXT="Power off at any time"/>
</node>
<node TEXT="Huge database Disk size"/>
<node TEXT="Deterministic Conflict resolution" FOLDED="true">
<node TEXT="Decides the head of the doucment"/>
<node TEXT="Keeps both documents"/>
<node TEXT="Leads to users seeing different data"/>
<node TEXT="Caused by Replication"/>
<node TEXT="Does not happen because of concurrency"/>
</node>
<node TEXT="Simplyfy">
<node TEXT="Undos"/>
<node TEXT="Searching"/>
<node TEXT="Auditing/Logging"/>
</node>
</node>
<node TEXT="Putting the couch online" FOLDED="true" POSITION="right">
<node TEXT="Clustering">
<node TEXT="Lounge">
<node TEXT="Used by meebo"/>
</node>
</node>
<node TEXT="Replication">
<node TEXT="Continous"/>
<node TEXT="Triggerred"/>
<node TEXT="Bidirctional/Unidirectional"/>
<node TEXT="Conflicts">
<node TEXT="_conflict propery on all documents in conflict">
<node TEXT="List of all dcs that it is in conflict with"/>
</node>
<node TEXT="Create a view to show conflicts"/>
<node TEXT="If you have worked with Notes Conflicst, you know"/>
</node>
</node>
</node>
<node TEXT="Off the couch" FOLDED="true" POSITION="left">
<node TEXT="Harder to do bulk updates">
<node TEXT="posting to _bulk_docs"/>
</node>
<node TEXT="Database sizes grow quite big and need for compaction"/>
<node TEXT="Sql queries seem simpler">
<node TEXT="Like queries are tough to do"/>
</node>
</node>
</node>
</map>
