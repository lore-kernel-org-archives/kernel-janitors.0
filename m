From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 16 Aug 2013 17:03:34 +0000
Subject: build regressions 2013-08-16
Message-Id: <520e5b66.pS6o5XCD+eMzxIH8%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
lib/assoc_array.c:1011:3: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
kernel/user_namespace.c:138:13: error: 'struct user_namespace' has no member named 'persistent_keyring_register'
drivers/tty/ehv_bytechan.c:362:1: error: type defaults to 'int' in declaration of 'console_initcall' [-Werror=implicit-int]
memory_hotplug.c:(.text+0xd0174): undefined reference to `is_hugepage_active'
drivers/usb/gadget/g_ffs.c:79:1: error: type defaults to 'int' in declaration of 'USB_ETHERNET_MODULE_PARAMETERS' [-Werror=implicit-int]
drivers/usb/gadget/g_ffs.c:79:1: error: function declaration isn't a prototype [-Werror=strict-prototypes]
memory_hotplug.c:(.ref.text+0x52f): undefined reference to `is_hugepage_active'

[warnings]
lib/assoc_array.c:1011:3: warning: return makes pointer from integer without a cast [enabled by default]
lib/assoc_array.c:1047:2: warning: return makes pointer from integer without a cast [enabled by default]
lib/assoc_array.c:1123:3: warning: return makes pointer from integer without a cast [enabled by default]
lib/assoc_array.c:1281:2: warning: return makes pointer from integer without a cast [enabled by default]
lib/assoc_array.c:1314:3: warning: return makes pointer from integer without a cast [enabled by default]
warning: (DRM_I915 && BIG_KEYS) selects TMPFS which has unmet direct dependencies (SHMEM)
warning: (DRM_I915 && BIG_KEYS) selects TMPFS which has unmet direct dependencies (SHMEM)
warning: (DRM_I915 && BIG_KEYS) selects TMPFS which has unmet direct dependencies (SHMEM)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
