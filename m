From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 01:36:44 +0000
Subject: [kees:module-fd-syscall 1/4] #warning syscall finit_module not implemented
Message-Id: <20120929013644.GB11675@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git module-fd-syscall
head:   fddb953b5898441d3a26d8912ac9d06489f4c1dc
commit: 1c0ef4c3ea38a42c9e326b1eb520bd8e58b48797 [1/4] module: add syscall to load module from fd
config: cris-allyesconfig

All warnings:

<stdin>:1178:2: warning: #warning syscall rt_tgsigqueueinfo not implemented [-Wcpp]
<stdin>:1181:2: warning: #warning syscall perf_event_open not implemented [-Wcpp]
<stdin>:1184:2: warning: #warning syscall recvmmsg not implemented [-Wcpp]
<stdin>:1187:2: warning: #warning syscall fanotify_init not implemented [-Wcpp]
<stdin>:1190:2: warning: #warning syscall fanotify_mark not implemented [-Wcpp]
<stdin>:1193:2: warning: #warning syscall prlimit64 not implemented [-Wcpp]
<stdin>:1196:2: warning: #warning syscall name_to_handle_at not implemented [-Wcpp]
<stdin>:1199:2: warning: #warning syscall open_by_handle_at not implemented [-Wcpp]
<stdin>:1202:2: warning: #warning syscall clock_adjtime not implemented [-Wcpp]
<stdin>:1205:2: warning: #warning syscall syncfs not implemented [-Wcpp]
<stdin>:1208:2: warning: #warning syscall sendmmsg not implemented [-Wcpp]
<stdin>:1214:2: warning: #warning syscall process_vm_readv not implemented [-Wcpp]
<stdin>:1217:2: warning: #warning syscall process_vm_writev not implemented [-Wcpp]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
<stdin>:1223:2: warning: #warning syscall finit_module not implemented [-Wcpp]

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
