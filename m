From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 27 Apr 2013 18:11:18 +0000
Subject: build regressions 2013-04-27
Message-Id: <517c14c6.8fslI3WkBkFHBuyu%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/sunrpc/auth_gss/gss_rpc_xdr.c:219:16: error: incompatible types when assigning to type 'kuid_t' from type 's32'
net/sunrpc/auth_gss/gss_rpc_xdr.c:225:16: error: incompatible types when assigning to type 'kgid_t' from type 's32'
net/sunrpc/auth_gss/gss_rpc_xdr.c:243:37: error: incompatible types when assigning to type 'kgid_t' from type 's32'
net/sunrpc/auth_gss/svcauth_gss.c:1856:2: error: implicit declaration of function 'create_use_gss_proxy_proc_entry' [-Werror=implicit-function-declaration]
net/sunrpc/auth_gss/svcauth_gss.c:1861:2: error: implicit declaration of function 'destroy_use_gss_proxy_proc_entry' [-Werror=implicit-function-declaration]

[warnings]
net/sunrpc/auth_gss/gss_rpc_xdr.c:243:3: warning: 'creds' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/i915_gem_stolen.c:139:2: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'int' [-Wformat]

[sparse]
net/sunrpc/auth_gss/gss_rpc_upcall.c:66:21: sparse: symbol 'gssp_procedures' was not declared. Should it be static?
net/sunrpc/auth_gss/gss_rpc_xdr.c:30:24: sparse: odd constant _Bool cast (ffffffffffffffe4 becomes 1)
net/sunrpc/auth_gss/svcauth_gss.c:1268:1: sparse: symbol 'use_gssp_lock' was not declared. Should it be static?

[coccinelle]
kernel/trace/trace_events.c:959:22-25: ERROR: reference preceded by free on line 957
kernel/trace/trace_events.c:959:22-25: ERROR: reference preceded by free on line 957
kernel/trace/trace_events.c:933:10-13: ERROR: invalid reference to the index variable of the iterator on line 915
kernel/trace/trace_events.c:933:10-13: ERROR: invalid reference to the index variable of the iterator on line 915

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
