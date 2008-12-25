From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 14:34:25 +0000
Subject: [PATCH 4/7] drivers/media/dvb/firesat: Use DEFINE_SPINLOCK
Message-Id: <Pine.LNX.4.64.0812251534060.22039@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v4l-dvb-maintainer@linuxtv.org, stefanr@s5r6.in-berlin.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
in Documentation/spinlocks.txt

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/media/dvb/firesat/firesat_1394.c b/drivers/media/dvb/firesat/firesat_1394.c
--- a/drivers/media/dvb/firesat/firesat_1394.c
+++ b/drivers/media/dvb/firesat/firesat_1394.c
@@ -94,7 +94,7 @@ MODULE_DEVICE_TABLE(ieee1394, firesat_id
 
 /* list of all firesat devices */
 LIST_HEAD(firesat_list);
-spinlock_t firesat_list_lock = SPIN_LOCK_UNLOCKED;
+DEFINE_SPINLOCK(firesat_list_lock);
 
 static void fcp_request(struct hpsb_host *host,
 			int nodeid,
