From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Dec 2019 22:05:26 +0000
Subject: [PATCH][next] thunderbolt: fix memory leak of object sw
Message-Id: <20191220220526.11307-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajmohan Mani <rajmohan.mani@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where the call tb_switch_exceeds_max_depth is true
the error reurn path leaks memory in sw.  Fix this by setting
the return error code to -EADDRNOTAVAIL and returning via the
error exit path err_free_sw_ports to free sw. sw has been kzalloc'd
so the free of the NULL sw->ports is fine.

Addresses-Coverity: ("Resource leak")
Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thunderbolt/switch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 3454e6154958..ad5479f21174 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1885,8 +1885,10 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 	sw->config.enabled = 0;
 
 	/* Make sure we do not exceed maximum topology limit */
-	if (tb_switch_exceeds_max_depth(sw, depth))
-		return ERR_PTR(-EADDRNOTAVAIL);
+	if (tb_switch_exceeds_max_depth(sw, depth)) {
+		ret = -EADDRNOTAVAIL;
+		goto err_free_sw_ports;
+	}
 
 	/* initialize ports */
 	sw->ports = kcalloc(sw->config.max_port_number + 1, sizeof(*sw->ports),
-- 
2.24.0
