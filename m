From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 25 Jun 2007 11:37:36 +0000
Subject: [KJ] [PATCH] Replace hard-coded constants by kernel.h macro.
Message-Id: <Pine.LNX.4.64.0706250736060.4206@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706250729480.4168@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706250729480.4168@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  based on the macro definition from kernel.h:

#define INT_MAX         ((int)(~0U>>1))

these appear to be the only examples of this in the entire tree.


diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
index f50f04b..2b641b1 100644
--- a/include/linux/cdrom.h
+++ b/include/linux/cdrom.h
@@ -414,8 +414,8 @@ struct cdrom_generic_command
 #define CDO_CHECK_TYPE		0x10    /* check type on open for data */

 /* Special codes used when specifying changer slots. */
-#define CDSL_NONE       	((int) (~0U>>1)-1)
-#define CDSL_CURRENT    	((int) (~0U>>1))
+#define CDSL_NONE       	(INT_MAX-1)
+#define CDSL_CURRENT    	INT_MAX

 /* For partition based multisession access. IDE can handle 64 partitions
  * per drive - SCSI CD-ROM's use minors to differentiate between the
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
