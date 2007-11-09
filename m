From: Jiri Olsa <olsajiri@gmail.com>
Date: Fri, 09 Nov 2007 11:33:13 +0000
Subject: [PATCH] isdn - remove dead config symbol from isdn code
Message-Id: <47344579.10405@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbol from isdn code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 include/linux/isdn.h |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/include/linux/isdn.h b/include/linux/isdn.h
index d0ecc8e..a2303b6 100644
--- a/include/linux/isdn.h
+++ b/include/linux/isdn.h
@@ -16,14 +16,8 @@
 
 #include <linux/ioctl.h>
 
-#ifdef CONFIG_COBALT_MICRO_SERVER
-/* Save memory */
-#define ISDN_MAX_DRIVERS    2
-#define ISDN_MAX_CHANNELS   8
-#else
 #define ISDN_MAX_DRIVERS    32
 #define ISDN_MAX_CHANNELS   64
-#endif
 
 /* New ioctl-codes */
 #define IIOCNETAIF  _IO('I',1)
