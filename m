From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 06:51:05 +0000
Subject: [PATCH 11/20] parisc: change to new flag variable
Message-Id: <1285224665-29831-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/parisc/math-emu/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/math-emu/Makefile b/arch/parisc/math-emu/Makefile
index 1f3f225..0bd63b0 100644
--- a/arch/parisc/math-emu/Makefile
+++ b/arch/parisc/math-emu/Makefile
@@ -3,7 +3,7 @@
 #
 
 # See arch/parisc/math-emu/README
-EXTRA_CFLAGS += -Wno-parentheses -Wno-implicit-function-declaration \
+ccflags-y := -Wno-parentheses -Wno-implicit-function-declaration \
 	-Wno-uninitialized -Wno-strict-prototypes -Wno-return-type \
 	-Wno-implicit-int
 
-- 
1.7.2.1

