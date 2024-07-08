## YAML Notes

### Overview
YAML is a human-readable data serialization format that is commonly used for configuration files and data exchange between languages with different data structures.

### Key Characteristics
- **Human-readable**: Easy to read and write for humans.
- **Language-agnostic**: Can be used with many programming languages.
- **Indentation-based**: Uses indentation to represent structure.
- **Supports complex data types**: Including mappings (dictionaries), sequences (lists), and scalars (strings, numbers).

### Syntax Rules

1. **Indentation**: 
   - Indentation is used to denote structure.
   - Indentation must be consistent. The same number of spaces should be used throughout the document.
   - Tabs are not allowed; use spaces only.

2. **Comments**:
   - Comments start with `#` and can be placed anywhere in the document.
   - Example: `# This is a comment`

3. **Key-Value Pairs**:
   - Represent mappings (dictionaries).
   - Key-value pairs are separated by a colon followed by a space.
   - Example:
     ```yaml
     name: John Doe
     age: 25
     ```

4. **Lists**:
   - Represent sequences (lists).
   - List items are prefixed with a dash and a space.
   - Example:
     ```yaml
     fruits:
       - Apple
       - Orange
       - Banana
     ```

5. **Nested Structures**:
   - Combine mappings and sequences to represent complex structures.
   - Use indentation to indicate nesting.
   - Example:
     ```yaml
     person:
       name: John Doe
       age: 25
       hobbies:
         - Reading
         - Hiking
     ```

6. **Multi-line Strings**:
   - Use `|` for block-style literals (preserves line breaks).
   - Use `>` for folded-style literals (joins lines with spaces).
   - Example:
     ```yaml
     description: |
       This is a multi-line
       block-style string.
     note: >
       This is a multi-line
       folded-style string.
     ```

7. **Special Characters**:
   - Strings containing special characters (e.g., `:`, `-`, `#`) must be enclosed in quotes.
   - Single quotes (`'`) or double quotes (`"`).
   - Example:
     ```yaml
     title: "The Great Gatsby"
     ```

### Example 1: Student Details

```yaml
student:
  name: Alice Smith
  age: 20
  gender: female
  courses:
    - Mathematics
    - Computer Science
    - Physics
  address:
    street: 123 Main Street
    city: Springfield
    postal_code: 12345
  contact:
    email: alice.smith@example.com
    phone: +1234567890
  grades:
    Mathematics: A
    Computer Science: B+
    Physics: A-
  hobbies:
    - Reading
    - Swimming
    - Painting
  graduated: false
  bio: >
    Alice is a second-year university student majoring in Computer Science.
    She enjoys learning new programming languages and participating in coding competitions.
```

### Example 2: Paris Trip

```yaml
paris_trip:
  destination: Paris, France
  duration:
    start_date: 2024-07-15
    end_date: 2024-07-25
  travelers:
    - name: John Doe
      passport_number: X1234567
      contact:
        email: john.doe@example.com
        phone: +1234567890
    - name: Jane Roe
      passport_number: Y7654321
      contact:
        email: jane.roe@example.com
        phone: +0987654321
  itinerary:
    - day: 1
      activities:
        - Arrival in Paris
        - Check-in at hotel
        - Evening walk along the Seine
    - day: 2
      activities:
        - Visit the Eiffel Tower
        - Lunch at a local bistro
        - Tour of the Louvre Museum
    - day: 3
      activities:
        - Day trip to Versailles
        - Explore the Palace and Gardens
    - day: 4
      activities:
        - Shopping on the Champs-Élysées
        - Visit to the Arc de Triomphe
    - day: 5
      activities:
        - Visit to Montmartre and Sacré-Cœur
        - Dinner at a Michelin-star restaurant
  accommodations:
    hotel:
      name: Parisian Delight Hotel
      address: 456 Champs-Élysées
      phone: +33123456789
  notes: |
    This trip is a celebration of John's and Jane's 10th wedding anniversary.
    Special arrangements have been made for a romantic dinner on the last night.
```

These examples demonstrate how to structure data using YAML for different use cases, including personal details and travel itineraries. YAML's simplicity and readability make it an ideal choice for configuration files and data representation.