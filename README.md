# bucket

a positive goal tracker with clear focus

## tech design draft

### backend

```
                        +----------------------- Server Cluster ----------------------
                        |
client (elm/js/wasm) <-----> bucket-server <-------> knotdb <--------> SeaweedFS
   ^                    |                               ^
   |                    |                               +---------> Redis
   |                    |
   |                    +-------------------------------------------------------------
   V
browser engine <---------> IndexDB / SQL (JsStore?)
```

Bucket-server will also provide auth & payment support.

KnotDB is also developed by Plabayo and can be found at <https://github.com/plabayo/knotdb>.
