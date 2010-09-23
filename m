From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 06:51:42 +0000
Subject: [PATCH 18/20] xtensa: change to new flag variable
Message-Id: <1285224702-30069-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/xtensa/boot/Makefile     |    2 +-
 arch/xtensa/boot/lib/Makefile |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 40aa55b4..70fd145 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -14,7 +14,7 @@ HOSTFLAGS	+= -Iarch/$(ARCH)/boot/include
 
 BIG_ENDIAN	:= $(shell echo -e __XTENSA_EB__ | $(CC) -E - | grep -v "\#")
 
-export EXTRA_CFLAGS
+export ccflags-y
 export BIG_ENDIAN
 
 subdir-y	:= lib
diff --git a/arch/xtensa/boot/lib/Makefile b/arch/xtensa/boot/lib/Makefile
index d3d2aa2..ad8952e 100644
--- a/arch/xtensa/boot/lib/Makefile
+++ b/arch/xtensa/boot/lib/Makefile
@@ -6,7 +6,7 @@ zlib	:= inffast.c inflate.c inftrees.c
 
 lib-y	+= $(zlib:.c=.o) zmem.o
 
-EXTRA_CFLAGS	+= -Ilib/zlib_inflate
+ccflags-y	:= -Ilib/zlib_inflate
 
 quiet_cmd_copy_zlib = COPY    $@
       cmd_copy_zlib = cat $< > $@
-- 
1.7.2.1

