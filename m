From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 15:19:18 +0000
Subject: [PATCH][next] usb: typec: mux: fix an unsigned less than zero check
Message-Id: <20190219151918.13114-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The checks of a negative nval indicating an error an never be true
as nval is currently a size_t which is of course unsigned and hence
never less than zero. Fix this by making nval an int.

Detected by CoverityScan, CID#1476863 ("Unsigned compared against 0) 
and CID#1476948 ("Loop bound")

Fixes: 96a6d031ca99 ("usb: typec: mux: Find the muxes by also matching against the device node")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/mux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index b94e2920eb38..64d2ed3fecb8 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -126,10 +126,9 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
 {
 	const struct typec_altmode_desc *desc = data;
 	struct typec_mux *mux;
-	size_t nval;
 	bool match;
 	u16 *val;
-	int i;
+	int i, nval;
 
 	if (!con->fwnode) {
 		list_for_each_entry(mux, &mux_list, entry)
-- 
2.20.1
