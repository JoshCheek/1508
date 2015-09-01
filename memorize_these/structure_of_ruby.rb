# An object is a hash that looks like this:
  { class:              ...,
    instance_variables: {}
  }

# A class is a hash that looks like this:
  { superclass:         ...,
    methods:            {},
    constants:          {},

    class:              ...,
    instance_variables: {},
  }

# A binding is a hash that looks like this:
  { self:            ...,
    local_variables: {},
    return_value:    ...,
    next_binding:    ...,
  }
