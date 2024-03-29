# Data Structures Operations Cheatsheet

## List operations

- Creating a new list
  - `[]`

- Accessing an element at an index
  - `Enum.at`

- Adding element
  - Prepending (fast)
    - `[new_item | existing_list]`
  - Appending (slow)
    - `[existing_list] ++ [new_item]`

- Removing an element
  - First element
    - `[_ | remaining_list] = existing_list`
  - Somewhere else
    - `List.delete_at`

## Tuple

- Creating a new tuple
  - `{}`

- Accessing an element at an index
  - `elem` or `Tuple.elem`

- Appending element
  - `Tuple.append`

- Removing an element
  - `Tuple.delete_at`

## Keyword List (List of Tagged tuples)

- Creating a new Keyword List
  - `[]`

- Accessing the values of a "key"
  - `kw[:key]` or `Keyword.get`

- Accessing all values of a "key"
  - `Keyword.get_all`

- Adding key value
  - Prepending
    - `[{:world, 4} | kw]`
  - Appending
    - `kw ++ [world: 5]`

- Removing a key
  - First entry
    - `Keyword.delete_first`
  - All entries
    - `Keyword.delete`

- Remove multiple keys
  - `Keyword.drop`

## Maps

- Creating a new Map
  - `%{}`

- Accessing the values of a "key"
  - `m[<key>]` or `Map.get`

- Adding key value
  - `Map.put`

- Updating key value
  - Replacing existing value
    - `m[<key>] = <value>` or `Map.put` or `%{m | <key> => <value>}`
  - Updating existing value
    `Map.update`

- Removing a key
  - `Map.delete`

- Remove multiple keys
  - `Map.drop`

## Structs

- Creating a new Struct
  - `%<StructModuleName>{}`

- Accessing the values of a struct
  - `s.<attr>` or `Map.get`

- Updating attributes
  - `%<StructModuleName>{s | <attr>: <value>}`
