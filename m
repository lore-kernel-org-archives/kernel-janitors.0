From: Julia Lawall <julia@diku.dk>
Date: Mon, 13 Jul 2009 08:55:00 +0000
Subject: [PATCH] arch/blackfin: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0907131054390.6808@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vapier@gentoo.org, uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Check that the result of kmalloc is not NULL before passing it to other
functions.

In the first two cases, the new code returns -ENOMEM, which seems
compatible with what is done for similar functions for other architectures.

In the last two cases, the new code fails silently, ie just returns,
because the function has void return type.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/blackfin/mach-common/smp.c     |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/blackfin/mach-common/smp.c b/arch/blackfin/mach-common/smp.c
index 6184005..10dd298 100644
--- a/arch/blackfin/mach-common/smp.c
+++ b/arch/blackfin/mach-common/smp.c
@@ -211,6 +211,8 @@ int smp_call_function(void (*func)(void *info), void *info, int wait)
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_ATOMIC);
+	if (!msg)
+		return -ENOMEM;
 	INIT_LIST_HEAD(&msg->list);
 	msg->call_struct.func = func;
 	msg->call_struct.info = info;
@@ -252,6 +254,8 @@ int smp_call_function_single(int cpuid, void (*func) (void *info), void *info,
 	cpu_set(cpu, callmap);
 
 	msg = kmalloc(sizeof(*msg), GFP_ATOMIC);
+	if (!msg)
+		return -ENOMEM;
 	INIT_LIST_HEAD(&msg->list);
 	msg->call_struct.func = func;
 	msg->call_struct.info = info;
@@ -287,6 +291,8 @@ void smp_send_reschedule(int cpu)
 		return;
 
 	msg = kmalloc(sizeof(*msg), GFP_ATOMIC);
+	if (!msg)
+		return;
 	memset(msg, 0, sizeof(msg));
 	INIT_LIST_HEAD(&msg->list);
 	msg->type = BFIN_IPI_RESCHEDULE;
@@ -314,6 +320,8 @@ void smp_send_stop(void)
 		return;
 
 	msg = kmalloc(sizeof(*msg), GFP_ATOMIC);
+	if (!msg)
+		return;
 	memset(msg, 0, sizeof(msg));
 	INIT_LIST_HEAD(&msg->list);
 	msg->type = BFIN_IPI_CPU_STOP;
