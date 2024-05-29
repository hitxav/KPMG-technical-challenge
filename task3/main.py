def get_data(data, key):
  # Split the key path into a list of keys
  key_list = key.split("/")
  # Traverse the nested dictionary using a loop
  current_data = data
  for key in key_list:
    if key in current_data:
      print(current_data[key])
      current_data = current_data[key]
    else:
      return None  # Key not found in current level

  return current_data

data1 = {"a": {"b": {"c": "d"}}}
data2 = {"x": {"y": {"z": "a"}}}

key1 = "a/b"
key2 = "x/y/z"

value1 = get_data(data1, key1)
value2 = get_data(data2, key2)

print(f"Value for key '{key1}': {value1}")
print(f"Value for key '{key2}': {value2}")
