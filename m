From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 06:50:57 +0000
Subject: [PATCH 09/20] microblaze: change to new flag variable
Message-Id: <1285224657-29763-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Simek <monstr@monstr.eu>
Cc: Grant Likely <grant.likely@secretlab.ca>, "David S. Miller" <davem@davemloft.net>, microblaze-uclinux@itee.uq.edu.au, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/microblaze/kernel/cpu/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/microblaze/kernel/cpu/Makefile b/arch/microblaze/kernel/cpu/Makefile
index 59cc7bc..fceed4e 100644
--- a/arch/microblaze/kernel/cpu/Makefile
+++ b/arch/microblaze/kernel/cpu/Makefile
@@ -6,7 +6,7 @@ ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_cache.o = -pg
 endif
 
-EXTRA_CFLAGS += -DCPU_MAJOR=$(CPU_MAJOR) -DCPU_MINOR=$(CPU_MINOR) \
+ccflags-y := -DCPU_MAJOR=$(CPU_MAJOR) -DCPU_MINOR=$(CPU_MINOR) \
 		-DCPU_REV=$(CPU_REV)
 
 obj-y += cache.o cpuinfo.o cpuinfo-pvr-full.o cpuinfo-static.o mb.o pvr.o
-- 
1.7.2.1

