From: matt mooney <mfm@muteddisk.com>
Date: Fri, 29 Apr 2011 21:14:02 +0000
Subject: [PATCH 2/2] driver-core: modify FIRMWARE_IN_KERNEL help message
Message-Id: <ab0bdf28351608def0ffee25605f8aff4b64fcd1.1304111377.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The help message for the configuration variable was inconsistent
with the way "make firmware_install" really works.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/base/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 5fe7fd2..52c6758 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -84,10 +84,10 @@ config FIRMWARE_IN_KERNEL
 	help
 	  The kernel source tree includes a number of firmware 'blobs'
 	  that are used by various drivers. The recommended way to
-	  use these is to run "make firmware_install" and to copy the
-	  resulting binary files created in usr/lib/firmware/ of the
-	  kernel tree to /lib/firmware/ on your system so that they can
-	  be loaded by userspace helpers on request.
+	  use these is to run "make firmware_install", which, after
+	  converting ihex files to binary, copies all of the needed
+	  binary files in firmware/ to /lib/firmware/ on your system so
+	  that they can be loaded by userspace helpers on request.
 
 	  Enabling this option will build each required firmware blob
 	  into the kernel directly, where request_firmware() will find
-- 
1.7.4.4

