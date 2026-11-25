// Map-typed configurables for exercising the console config form
// (choreo-console PR #11535 review: map entries and map-of-union values).

# A server in a cluster.
type Server record {|
    # Hostname of the server
    string host;
    # Port of the server
    int port = 3306;
|};

# A file output target.
type FileTarget record {|
    # Path of the output file
    string path;
    # Write mode
    string mode = "append";
|};

# Cluster configuration: a required record holding optional maps.
type ClusterConfig record {|
    # Name of the cluster
    string name;
    # Servers keyed by name (map of records)
    map<Server> servers?;
    # Output targets keyed by name (map of record|string unions)
    map<FileTarget|string> targets?;
|};

# Required cluster configuration.
configurable ClusterConfig cluster = ?;

# Optional top-level map of records.
configurable map<Server> standaloneServers = {};
