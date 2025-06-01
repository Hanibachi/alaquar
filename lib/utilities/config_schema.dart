Map configSchema() => {
  "title": "Config",
  "description": "A configuration file for alaquar",
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "background": {
      "oneOf": [
        {r"$ref": r"#/$defs/bg"},
        {
          "type": "array",
          "uniqueItems": true,
          "minItems": 1,
          "items": {r"$ref": r"#/$defs/bg"},
        },
      ],
    },
  },

  r"$defs": {
    "bg": backgroundConfigSchema,
  },
};

var backgroundConfigSchema = {
  "description": "The background config",
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "monitorId": {"type": "integer"},
    "color": {"type": "string", "pattern": r"^#([0-9a-fA-F]{3}){1,2}$"},
    "image": {"type": "string", "pattern": r"^/(?:[^/]+/)*[^/.]+\.(?:jpg|jpeg|png|gif|bmp|webp|bmp)$"},
    "slides": {"type": "string", "pattern": r"^/(?:[^/]+/)*$"},
    "recursive": {"type": "boolean"},
    "duration": {"type": "integer", "minimum": 1, "exclusiveMinimum": 1},
  },
  "dependencies": {
    "slides": ["duration"],
    "duration": ["slides"],
    "recursive": ["slides"],
  },
  "allOf": [
    // Rule 1: At least one of color, image, or slides must be present.
    {
      "anyOf": [
        {
          "required": ["color"],
        },
        {
          "required": ["image"],
        },
        {
          "required": ["slides"],
        },
      ],
    },
    // Rule 2: Image and Slides are mutually exclusive. It cannot be the case that BOTH image AND slides are present.
    {
      "not": {
        "allOf": [
          {
            "required": ["image"],
          },
          {
            "required": ["slides"],
          },
        ],
      },
    },
  ],
};
