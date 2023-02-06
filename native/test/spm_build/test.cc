/*
 *
 * Copyright 2021 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

// NOTE(ncooke3): Change `grpcpp` to `grpc-c++`.
#include "grpc-c++/channel.h"
#include "grpc-c++/client_context.h"
#include "grpc-c++/completion_queue.h"
#include "grpc-c++/create_channel.h"
#include "grpc-c++/generic/generic_stub.h"
#include "grpc-c++/grpcpp.h"
#include "grpc-c++/support/byte_buffer.h"
#include "grpc-c++/support/status.h"
#include "grpc-c++/support/status_code_enum.h"
#include "grpc-c++/support/string_ref.h"
