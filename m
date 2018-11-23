From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 07:15:05 +0000
Subject: [PATCH 2/2] ic3: master: off by one in mode_show()
Message-Id: <20181123071505.ahhh7xqvt4eb7tt2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be >= ARRAY_SIZE() to avoid reading one element beyond the
end of the array.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index bda4b9613e53..c39f89d2deba 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -475,7 +475,7 @@ static ssize_t mode_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(i3cbus);
 	if (i3cbus->mode < 0 ||
-	    i3cbus->mode > ARRAY_SIZE(i3c_bus_mode_strings) ||
+	    i3cbus->mode >= ARRAY_SIZE(i3c_bus_mode_strings) ||
 	    !i3c_bus_mode_strings[i3cbus->mode])
 		ret = sprintf(buf, "unknown\n");
 	else
-- 
2.11.0
