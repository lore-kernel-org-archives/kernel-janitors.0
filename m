From: Grant Coady <lkml@dodo.com.au>
Date: Fri, 29 Jul 2005 22:07:42 +0000
Subject: [KJ] RFC PATCH trivial: kbuild inconsistent CONFIG_DEBUG_INFO usage
Message-Id: <ds9le1t2ec1qg60t7p02oo9na4cpogtsep@4ax.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96518546066385724=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96518546066385724==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 27 Jul 2005 21:43:52 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
>
>I think the first can be
>
>ifdef CONFIG_DEBUG_INFO
>
>and the second
>
>ifndef CONFIG_DEBUG_INFO

Okay, this trivial patch restores consistent build flags usage to 
Makefile in arch/arm26 and arch/x86_64



Signed-off-by: Grant Coady <gcoady@gmail.com>

---
 arm26/Makefile  |    6 +++---
 x86_64/Makefile |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff -Nrup -X dontdiff linux-2.6.13-rc3-mm3/arch/arm26/Makefile linux-2.6.13-rc3-mm3c/arch/arm26/Makefile
--- linux-2.6.13-rc3-mm3/arch/arm26/Makefile	2005-06-18 05:48:29.000000000 +1000
+++ linux-2.6.13-rc3-mm3c/arch/arm26/Makefile	2005-07-29 16:29:35.000000000 +1000
@@ -13,11 +13,11 @@ CPPFLAGS_vmlinux.lds = -DTEXTADDR=$(TEXT
 OBJCOPYFLAGS	:=-O binary -R .note -R .comment -S
 GZFLAGS		:=-9
 
-ifeq ($(CONFIG_FRAME_POINTER),y)
+ifdef CONFIG_FRAME_POINTER
 CFLAGS		+=-fno-omit-frame-pointer -mno-sched-prolog
 endif
 
-ifeq ($(CONFIG_DEBUG_INFO),y)
+ifdef CONFIG_DEBUG_INFO
 CFLAGS		+=-g
 endif
 
@@ -25,7 +25,7 @@ CFLAGS_BOOT	:=-mapcs-26 -mcpu=arm3 -msof
 CFLAGS		+=-mapcs-26 -mcpu=arm3 -msoft-float -Uarm
 AFLAGS		+=-mapcs-26 -mcpu=arm3 -msoft-float
 
-ifeq ($(CONFIG_XIP_KERNEL),y)
+ifdef CONFIG_XIP_KERNEL
   TEXTADDR	 := 0x03880000
   DATAADDR	 := 0x02080000
 else
diff -Nrup -X dontdiff linux-2.6.13-rc3-mm3/arch/x86_64/Makefile linux-2.6.13-rc3-mm3c/arch/x86_64/Makefile
--- linux-2.6.13-rc3-mm3/arch/x86_64/Makefile	2005-07-28 22:20:15.000000000 +1000
+++ linux-2.6.13-rc3-mm3c/arch/x86_64/Makefile	2005-07-29 16:31:04.000000000 +1000
@@ -38,7 +38,7 @@ CFLAGS += -pipe
 # actually it makes the kernel smaller too.
 CFLAGS += -fno-reorder-blocks	
 CFLAGS += -Wno-sign-compare
-ifneq ($(CONFIG_DEBUG_INFO),y)
+ifndef CONFIG_DEBUG_INFO
 CFLAGS += -fno-asynchronous-unwind-tables
 # -fweb shrinks the kernel a bit, but the difference is very small
 # it also messes up debugging, so don't use it for now.

--===============96518546066385724==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96518546066385724==--
