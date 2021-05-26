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

class keyboard {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input1 = null;
      this.input2 = null;
    }
    else {
      if (initObj.hasOwnProperty('input1')) {
        this.input1 = initObj.input1
      }
      else {
        this.input1 = 0;
      }
      if (initObj.hasOwnProperty('input2')) {
        this.input2 = initObj.input2
      }
      else {
        this.input2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type keyboard
    // Serialize message field [input1]
    bufferOffset = _serializer.int32(obj.input1, buffer, bufferOffset);
    // Serialize message field [input2]
    bufferOffset = _serializer.int32(obj.input2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type keyboard
    let len;
    let data = new keyboard(null);
    // Deserialize message field [input1]
    data.input1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [input2]
    data.input2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wpm2_tutorials/keyboard';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'edeabc49039f3caeacd6317ca5d6e180';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 input1
    int32 input2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new keyboard(null);
    if (msg.input1 !== undefined) {
      resolved.input1 = msg.input1;
    }
    else {
      resolved.input1 = 0
    }

    if (msg.input2 !== undefined) {
      resolved.input2 = msg.input2;
    }
    else {
      resolved.input2 = 0
    }

    return resolved;
    }
};

module.exports = keyboard;
