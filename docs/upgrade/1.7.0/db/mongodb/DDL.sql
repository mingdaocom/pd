use mdworksheet;

db.customicon.createIndex({ "pid": 1, "name": 1,}, { background: true, name: "ix_pid_name" });
