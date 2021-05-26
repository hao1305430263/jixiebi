// Auto-generated. Do not edit!

// (in-package wpm2_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class voc_sign_publisher {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.h = null;
      this.w = null;
      this.h1 = null;
      this.w1 = null;
      this.sign = null;
    }
    else {
      if (initObj.hasOwnProperty('h')) {
        this.h = initObj.h
      }
      else {
        this.h = 0.0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0.0;
      }
      if (initObj.hasOwnProperty('h1')) {
        this.h1 = initObj.h1
      }
      else {
        this.h1 = 0.0;
      }
      if (initObj.hasOwnProperty('w1')) {
        this.w1 = initObj.w1
      }
      else {
        this.w1 = 0.0;
      }
      if (initObj.hasOwnProperty('sign')) {
        this.sign = initObj.sign
      }
      else {
        this.sign = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type voc_sign_publisher
    // Serialize message field [h]
    bufferOffset = _serializer.float32(obj.h, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float32(obj.w, buffer, bufferOffset);
    // Serialize message field [h1]
    bufferOffset = _serializer.float32(obj.h1, buffer, bufferOffset);
    // Serialize message field [w1]
    bufferOffset = _serializer.float32(obj.w1, buffer, bufferOffset);
    // Serialize message field [sign]
    bufferOffset = _serializer.int32(obj.sign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type voc_sign_publisher
    let len;
    let data = new voc_sign_publisher(null);
    // Deserialize message field [h]
    data.h = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [h1]
    data.h1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [w1]
    data.w1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sign]
    data.sign = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wpm2_tutorials/voc_sign_publisher';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '124c383f53dd0a8e55cd05d9f136c3e3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 h
    float32 w
    float32 h1
    float32 w1
    int32 sign
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new voc_sign_publisher(null);
    if (msg.h !== undefined) {
      resolved.h = msg.h;
    }
    else {
      resolved.h = 0.0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0.0
    }

    if (msg.h1 !== undefined) {
      resolved.h1 = msg.h1;
    }
    else {
      resolved.h1 = 0.0
    }

    if (msg.w1 !== undefined) {
      resolved.w1 = msg.w1;
    }
    else {
      resolved.w1 = 0.0
    }

    if (msg.sign !== undefined) {
      resolved.sign = msg.sign;
    }
    else {
      resolved.sign = 0
    }

    return resolved;
    }
};

module.exports = voc_sign_publisher;
