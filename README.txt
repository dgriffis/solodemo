TrendSetter

***********************
INTRO
***********************
TrendSetter is a Search and Recommendations framework that enables:

1. Search and Recommendations between different data sets, e.g. "Lucene search indexes" such as council members to council members, 
open projects to council members, resumes to council members

2. Rapid development and deployment of new data sets.  Database- or document-centric (or both) data sets can be quickly 
defined, developed and indexed, usually within a day.

3. Rapid application development.  Combining a lightweight UI that is mostly markup and Javascript with a minimum of server-side 
templating with REST-ful services allows new Search and Recommendation applications to be implemented very quickly.

4. Minimizing code support and maintenance.  Wherever possible, highly supported and production-ready open source 
software is used to deliver value.  The "not built here" folly is not found here!

5. Easy deployment.  Chef (solo) auto deployment is built in to the project.  With a minimum of required configuration a
fresh Trendsetter instance is quickly bootstrapped to an Ubuntu Linux physical or virtual machine.
 
So far, Trendsetter supports the following data sets:

* Council Members
* Resumes
* Open Projects
* Evernote Projects
* KDrive documents

**************************
BUILDING:
**************************
TrendSetter can be compiled with Buildr.

**************************
DEPLOYING:
**************************
TrendSetter can be deployed with either Chef-Solo or Chef-Client/Server
