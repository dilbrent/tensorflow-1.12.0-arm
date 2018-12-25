# grep -Rl 'lib' | xargs sed -i 's/lib/lib/g'

#bazel build -c opt  --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-std=c99"  \
#--copt="-fomit-frame-pointer" --local_resources 1024,1.0,1.0 --verbose_failures \
#tensorflow/tools/pip_package:build_pip_package


#bazel build -c opt --copt="-mfpu=neon-vfpv4" --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" \
#--local_resources 1024,1.0,1.0 --verbose_failures tensorflow/tools/pip_package:build_pip_package

#git checkout r1.12
#git checkout -f 3437098ba5b111817ef6ac5906d86934168704b7
#tensorflow/core/kernels/list_kernels.h

// https://github.com/tensorflow/serving/issues/832

// VladislavSu commented on Jul 23
// My workaround is
// In file:
// /home/<user_name>/.cache/bazel/_bazel_<user_name>/<hash>/external/aws/BUILD.bazel
// (where <user_name> - user current linux user name,
// <hash> is hash like de4a7858eac0c7de37e543fdc903ef12)

// In section (cc_library) in my case line 27 replace:
// "//conditions:default": []"
// with
// "//conditions:default": glob(["aws-cpp-sdk-core/source/platform/linux-shared/*.cpp",]),

// Then it will successfully build on Jetson.


bazel build -c opt --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" \
--config=noaws --local_resources 1024,1.0,1.0 --verbose_failures tensorflow/tools/pip_package:build_pip_package


#bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

