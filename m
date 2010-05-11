From: matt mooney <mfm@muteddisk.com>
Date: Tue, 11 May 2010 09:45:50 +0000
Subject: [PATCH 1/2] kbuild/makefile.txt: Fix examples
Message-Id: <20100511094550.GA16871@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: matt mooney <mfm@muteddisk.com>

Update section 3.2 and 3.5 examples, along with text in section 
3.5 to reflect change.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 Documentation/kbuild/makefiles.txt |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index b25507d..6004671 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -168,7 +168,7 @@ more details, with real examples.
 		#drivers/isdn/i4l/Makefile
 		# Makefile for the kernel ISDN subsystem and device drivers.
 		# Each configuration option enables a list of files.
-		obj-$(CONFIG_ISDN)             += isdn.o
+		obj-$(CONFIG_ISDN_I4L)         += isdn.o
 		obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o

 --- 3.3 Loadable module goals - obj-m
@@ -245,12 +245,12 @@ more details, with real examples.
 	may contain both a built-in.o and a lib.a file.

 	Example:
-		#arch/i386/lib/Makefile
-		lib-y    := checksum.o delay.o
+		#arch/x86/lib/Makefile
+		lib-y    := delay.o

-	This will create a library lib.a based on checksum.o and delay.o.
-	For kbuild to actually recognize that there is a lib.a being built,
-	the directory shall be listed in libs-y.
+	This will create a library lib.a based on delay.o. For kbuild to
+	actually recognize that there is a lib.a being built, the directory
+	shall be listed in libs-y.
 	See also "6.3 List directories to visit when descending".

 	Use of lib-y is normally restricted to lib/ and arch/*/lib.
--
1.6.6.1
