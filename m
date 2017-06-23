From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 15:17:38 +0000
Subject: [PATCH] libertas: Fix lbs_prb_rsp_limit_set()
Message-Id: <20170623151738.qxncismrvd4yzzfr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>
Cc: libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The kstrtoul() test was reversed so this always returned -ENOTSUPP.

Fixes: 27d7f47756f4 ("net: wireless: replace strict_strtoul() with kstrtoul()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/libertas/mesh.c b/drivers/net/wireless/marvell/libertas/mesh.c
index eeeb892219aa..37ace5cb309d 100644
--- a/drivers/net/wireless/marvell/libertas/mesh.c
+++ b/drivers/net/wireless/marvell/libertas/mesh.c
@@ -233,8 +233,9 @@ static ssize_t lbs_prb_rsp_limit_set(struct device *dev,
 	memset(&mesh_access, 0, sizeof(mesh_access));
 	mesh_access.data[0] = cpu_to_le32(CMD_ACT_SET);
 
-	if (!kstrtoul(buf, 10, &retry_limit))
-		return -ENOTSUPP;
+	ret = kstrtoul(buf, 10, &retry_limit);
+	if (ret)
+		return ret;
 	if (retry_limit > 15)
 		return -ENOTSUPP;
 
