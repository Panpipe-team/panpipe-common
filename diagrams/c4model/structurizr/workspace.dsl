workspace "Name" "Description" {

    model {
        u = person "Customer"

        s = softwareSystem "Panpipe" "Allows customers to view, create and edit habits and habit boards" {
            spa = container "Single-Page Application" "Provides Panpipe functionality to customers via their web browser"\
             "TypeScript + React" "Browser" 
            webapp = container "Web Application" "Delivers the static content and Panpipe single-page application" "Node JS"
            apiapp = container "Api Application" "Provides Panpipe functionality via a JSON/HTTPS API" ".Net"
            database = container "Database" "Stores users, habits, habit boards information etc." "PostgreSQL Schema" "Database"
        }
        
        u -> spa "Views and uses habit boards using"
        u -> webapp "Visits Panpipe website using"
        webCallsRel = webapp -> spa "Delivers to the customer's web browser"
        apiCallsRel = spa -> apiapp "Makes API calls to" "HTTPS/JSON"
        apiapp -> database "Reads from and writes to" "SQL/TCP"

        production = deploymentEnvironment "Production" {
            deploymentNode "Customer's computer" "" "Microsoft Windows, Apple maxOS or Linux" {
                deploymentNode "Web Browser" "" "Chrome, Firefox, Safari or Edge" {
                    spaInstance = containerInstance spa
                }
            }

            vps = deploymentNode "Student's VPS" "" "Ubuntu 22.04 LTS" {
                nginx = infrastructureNode "Reverse proxy" "Forwards requests to corresponging servers" "nginx" 

                deploymentNode "WebApp Container" "" "Docker" {
                    webappInstance = containerInstance webapp
                }

                deploymentNode "ApiApp Container" "" "Docker" {
                    apiappInstance = containerInstance apiapp
                }
                
                deploymentNode "DB Container" "" "Docker" {
                    deploymentNode "PostgreSQL Server" {
                        containerInstance database
                    }
                }

                
                nginx -> webappInstance "Forwards website visit calls to" "HTTP/JSON"
                nginx -> apiappInstance "Forwards API calls to" "HTTP/JSON"
            }

            spaInstance -> nginx "Visits website and makes API calls using" "HTTPS/JSON"
        }
    }

    views {
        systemContext s {
            include *
            autoLayout tb
        }

        container s {
            include *   
        }

        deployment s production {
            include *
            exclude webCallsRel
            exclude apiCallsRel
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #05527d
                shape person
            }
            element "Software System" {
                background #066296
            }
            element "Container" {
                background #0773af
            }
            element "Infrastructure Node" {
                 background #0773af
            }
            element "Browser" {
                shape webBrowser
            }
            element "Database" {
                shape cylinder
            }
        }
    }

}