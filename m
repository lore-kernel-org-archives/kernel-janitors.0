From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 13:43:33 +0000
Subject: [PATCH][next] usb: typec: mux: remove redundant check on variable match
Message-Id: <20190219134333.10142-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

All the code paths that lead to the return statement are where
match is always true, hence the check to see if it is true is
redundant and can be removed.

Detected by CoverityScan, CID#14769672 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index a5947d98824d..b94e2920eb38 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -184,7 +184,7 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
 		if (dev_fwnode(mux->dev) = con->fwnode)
 			return mux;
 
-	return match ? ERR_PTR(-EPROBE_DEFER) : NULL;
+	return ERR_PTR(-EPROBE_DEFER);
 }
 
 /**
-- 
2.20.1
