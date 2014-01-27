sensu-windows Cookbook
==========================

A cookbook to provision sensu for windows.

Requirements
------------
- chef
- sensu server
- [windows](https://github.com/opscode-cookbooks/windows) cookbook

You'll need to add the `cert.pm` to `./files/default/cert.pem` and `key.pem` to `./files/default/key.pem` for your 
sensu server. You'll also need to add you're rabbitmq instance to `./files/default/rabbitmq.json`. Yes, I'm planning on 
creating that as an attribute.

Usage
-----
#### sensu-windows::default

e.g.
Just include `sensu-windows` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sensu-windows]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: JJ Asghar
