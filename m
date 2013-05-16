From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 May 2013 08:11:08 +0000
Subject: [patch] pktcdvd: silence static checker warning
Message-Id: <20130516081108.GC7494@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain about widening the binary "not" operations here
because sectors are u64 and "(pd)->settings.size" is unsigned int.
It unintentionally clears the high 32 bits of the sector.  This means
that the driver won't work for devices with over 2TB of space.  Since
this is a DVD drive, we're unlikely to reach that limit, but we may as
well silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 898fa74..09142c4 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -83,7 +83,8 @@
 
 #define MAX_SPEED 0xffff
 
-#define ZONE(sector, pd) (((sector) + (pd)->offset) & ~((pd)->settings.size - 1))
+#define ZONE(sector, pd) (((sector) + (pd)->offset) & \
+			~(sector_t)((pd)->settings.size - 1))
 
 static DEFINE_MUTEX(pktcdvd_mutex);
 static struct pktcdvd_device *pkt_devs[MAX_WRITERS];
