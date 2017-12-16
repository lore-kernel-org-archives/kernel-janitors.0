From: Colin King <colin.king@canonical.com>
Date: Sat, 16 Dec 2017 23:44:24 +0000
Subject: [PATCH][next] mei: fix spelling mistake: "botther" -> "bother"
Message-Id: <20171216234424.5708-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg debug message. Also
add in a missing comma.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mei/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 2a5146bdecf1..3e5eabdae8d9 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -549,7 +549,7 @@ int mei_cldev_disable(struct mei_cl_device *cldev)
 	}
 
 	if (bus->dev_state = MEI_DEV_POWER_DOWN) {
-		dev_dbg(bus->dev, "Device is powering down don't botther with disconnection\n");
+		dev_dbg(bus->dev, "Device is powering down, don't bother with disconnection\n");
 		err = 0;
 		goto out;
 	}
-- 
2.14.1

