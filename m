From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Sat, 11 Sep 2010 02:07:57 +0000
Subject: [PATCH] trivial: header.S: replace i386 with x86 in comment for type_of_loader
Message-Id: <4C8AE47D.9020507@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

For i386 dir under arch and Documentation renamed to x86, 
the comment should be modified accordingly.

The patch is against 2.6.36-rc3. Please check it.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 arch/x86/boot/header.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 93e689f..bdb4d45 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -129,7 +129,7 @@ start_sys_seg:	.word	SYSSEG		# obsolete and meaningless, but just
 
 type_of_loader:	.byte	0	# 0 means ancient bootloader, newer
 					# bootloaders know to change this.
-					# See Documentation/i386/boot.txt for
+					# See Documentation/x86/boot.txt for
 					# assigned ids
 
 # flags, unused bits must be zero (RFU) bit within loadflags
-- 
1.6.3.3
