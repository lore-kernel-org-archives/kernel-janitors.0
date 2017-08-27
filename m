From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 27 Aug 2017 06:30:34 +0000
Subject: [PATCH] libnvdimm, btt: check memory allocation failure
Message-Id: <20170827063034.4802-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, vishal.l.verma@intel.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org

Check memory allocation failures and return -ENOMEM in such cases, as
already done few lines below for another memory allocation.

This avoids NULL pointers dereference.

Fixes: 14e494542636 ("libnvdimm, btt: BTT updates for UEFI 2.7 format")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nvdimm/btt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 60491641a8d6..607184ebcfbf 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1431,6 +1431,8 @@ int nvdimm_namespace_attach_btt(struct nd_namespace_common *ndns)
 	}
 
 	btt_sb = devm_kzalloc(&nd_btt->dev, sizeof(*btt_sb), GFP_KERNEL);
+	if (!btt_sb)
+		return -ENOMEM;
 
 	/*
 	 * If this returns < 0, that is ok as it just means there wasn't
-- 
2.11.0

