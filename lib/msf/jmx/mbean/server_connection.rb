# -*- coding: binary -*-

module Msf
  module Jmx
    module MBean
      module ServerConnection

        def build_create_instance(id, name)
          stream = Rex::Java::Serialization::Model::Stream.new

          block_data = Rex::Java::Serialization::Model::BlockData.new
          block_data.contents << id
          block_data.contents << "\xff\xff\xff\xff\x22\xd7\xfd\x4a\x90\x6a\xc8\xe6"
          block_data.length = block_data.contents.length

          stream.contents << block_data
          stream.contents << Rex::Java::Serialization::Model::Utf.new(nil, name)
          stream.contents << Rex::Java::Serialization::Model::NullReference.new
          stream.contents << Rex::Java::Serialization::Model::NullReference.new

          stream
        end

        def build_get_instance(id, name)
          stream = Rex::Java::Serialization::Model::Stream.new

          block_data = Rex::Java::Serialization::Model::BlockData.new
          block_data.contents = id
          block_data.contents << "\xff\xff\xff\xff\x60\x73\xb3\x36\x1f\x37\xbd\xc2"
          block_data.length = block_data.contents.length

          stream.contents << block_data

          new_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          new_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, 'javax.management.ObjectName')
          new_class_desc.serial_version = 0xf03a71beb6d15cf
          new_class_desc.flags = 3
          new_class_desc.fields = []
          new_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          new_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::NullReference.new,
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          new_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          new_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new

          new_object = Rex::Java::Serialization::Model::NewObject.new
          new_object.class_desc = Rex::Java::Serialization::Model::ClassDesc.new
          new_object.class_desc.description = new_class_desc
          new_object.class_data = []

          stream.contents << new_object
          stream.contents << Rex::Java::Serialization::Model::Utf.new(nil, name)
          stream.contents << Rex::Java::Serialization::Model::EndBlockData.new
          stream.contents << Rex::Java::Serialization::Model::NullReference.new

          stream
        end

        def build_invoke(id, object_name, method_name, arguments)
          stream = Rex::Java::Serialization::Model::Stream.new

          block_data = Rex::Java::Serialization::Model::BlockData.new
          block_data.contents = id
          block_data.contents  << "\xff\xff\xff\xff\x13\xe7\xd6\x94\x17\xe5\xda\x20"
          block_data.length = block_data.contents.length

          stream.contents << block_data

          new_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          new_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, 'javax.management.ObjectName')
          new_class_desc.serial_version = 0xf03a71beb6d15cf
          new_class_desc.flags = 3
          new_class_desc.fields = []
          new_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          new_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::NullReference.new,
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          new_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          new_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new

          new_object = Rex::Java::Serialization::Model::NewObject.new
          new_object.class_desc = Rex::Java::Serialization::Model::ClassDesc.new
          new_object.class_desc.description = new_class_desc
          new_object.class_data = []

          stream.contents << new_object
          stream.contents << Rex::Java::Serialization::Model::Utf.new(nil, object_name)
          stream.contents << Rex::Java::Serialization::Model::EndBlockData.new

          stream.contents << Rex::Java::Serialization::Model::Utf.new(nil, method_name)

          marshall_object_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          marshall_object_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, 'java.rmi.MarshalledObject')
          marshall_object_class_desc.serial_version = 0x7cbd1e97ed63fc3e
          marshall_object_class_desc.flags = 2
          marshall_object_class_desc.fields = [
              Rex::Java::Serialization::Model::Field.new,
              Rex::Java::Serialization::Model::Field.new,
              Rex::Java::Serialization::Model::Field.new
          ]

          marshall_object_class_desc.fields[0].type = 'int'
          marshall_object_class_desc.fields[0].name = Rex::Java::Serialization::Model::Utf.new(nil, 'hash')

          marshall_object_class_desc.fields[1].type = 'array'
          marshall_object_class_desc.fields[1].name = Rex::Java::Serialization::Model::Utf.new(nil, 'locBytes')
          marshall_object_class_desc.fields[1].field_type = Rex::Java::Serialization::Model::Utf.new(nil, '[B')

          marshall_object_class_desc.fields[2].type = 'array'
          marshall_object_class_desc.fields[2].name = Rex::Java::Serialization::Model::Utf.new(nil, 'objBytes')
          marshall_object_class_desc.fields[2].field_type = Rex::Java::Serialization::Model::Utf.new(nil, '[B')

          marshall_object_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          marshall_object_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::NullReference.new,
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          marshall_object_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          marshall_object_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new


          data_binary_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          data_binary_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, '[B')
          data_binary_class_desc.serial_version = 0xacf317f8060854e0
          data_binary_class_desc.flags = 2
          data_binary_class_desc.fields = []
          data_binary_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          data_binary_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::NullReference.new,
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          data_binary_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          data_binary_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new

          data_binary = Rex::Java::Serialization::Model::NewArray.new
          data_binary.array_description = Rex::Java::Serialization::Model::ClassDesc.new
          data_binary.array_description.description = data_binary_class_desc
          data_binary.type = 'byte'
          data_binary.values = marshalled_argument(arguments).encode.unpack('C*')

          marshall_object = Rex::Java::Serialization::Model::NewObject.new
          marshall_object.class_desc = Rex::Java::Serialization::Model::ClassDesc.new
          marshall_object.class_desc.description = marshall_object_class_desc
          marshall_object.class_data = [
              ["int", 1919492550],
              Rex::Java::Serialization::Model::NullReference.new,
              data_binary
          ]

          stream.contents << marshall_object

          new_array_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          new_array_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, '[Ljava.lang.String;')
          new_array_class_desc.serial_version = 0xadd256e7e91d7b47
          new_array_class_desc.flags = 2
          new_array_class_desc.fields = []
          new_array_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          new_array_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::NullReference.new,
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          new_array_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          new_array_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new

          new_array = Rex::Java::Serialization::Model::NewArray.new
          new_array.array_description = Rex::Java::Serialization::Model::ClassDesc.new
          new_array.array_description.description = new_array_class_desc
          new_array.type = 'java.lang.String;'
          new_array.values = []
          arguments.keys.each do |k|
            new_array.values << Rex::Java::Serialization::Model::Utf.new(nil, k)
          end

          stream.contents << new_array

          stream.contents << Rex::Java::Serialization::Model::NullReference.new

          stream
        end

        def marshalled_argument(arguments)
          stream = Rex::Java::Serialization::Model::Stream.new

          new_array_class_desc = Rex::Java::Serialization::Model::NewClassDesc.new
          new_array_class_desc.class_name = Rex::Java::Serialization::Model::Utf.new(nil, '[Ljava.lang.Object;')
          new_array_class_desc.serial_version = 0x90ce589f1073296c
          new_array_class_desc.flags = 2
          new_array_class_desc.fields = []
          new_array_class_desc.class_annotation = Rex::Java::Serialization::Model::Annotation.new
          new_array_class_desc.class_annotation.contents = [
              Rex::Java::Serialization::Model::EndBlockData.new
          ]
          new_array_class_desc.super_class = Rex::Java::Serialization::Model::ClassDesc.new
          new_array_class_desc.super_class.description = Rex::Java::Serialization::Model::NullReference.new

          new_array = Rex::Java::Serialization::Model::NewArray.new
          new_array.array_description = Rex::Java::Serialization::Model::ClassDesc.new
          new_array.array_description.description = new_array_class_desc
          new_array.type = 'java.lang.Object;'
          new_array.values = [ ]
          arguments.values.each do |v|
            new_array.values << Rex::Java::Serialization::Model::Utf.new(nil, v)
          end
          stream.contents << new_array

          stream
        end
      end
    end
  end
end
