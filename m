From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 20:25:36 +0000
Subject: [PATCH] hsi_char: Delete an error message for a failed memory allocation in hsc_probe()
Message-Id: <afea2865-4862-c252-ad38-0f23842e5553@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 21:21:12 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/hsi_char.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hsi/clients/hsi_char.c b/drivers/hsi/clients/hsi_char.c
index cf9c2a332ad8..9d2a6d64dfb8 100644
--- a/drivers/hsi/clients/hsi_char.c
+++ b/drivers/hsi/clients/hsi_char.c
@@ -697,10 +697,9 @@ static int hsc_probe(struct device *dev)
 	int i;
 
 	cl_data = kzalloc(sizeof(*cl_data), GFP_KERNEL);
-	if (!cl_data) {
-		dev_err(dev, "Could not allocate hsc_client_data\n");
+	if (!cl_data)
 		return -ENOMEM;
-	}
+
 	hsc_baseminor = HSC_BASEMINOR(hsi_id(cl), hsi_port_id(cl));
 	if (!hsc_major) {
 		ret = alloc_chrdev_region(&hsc_dev, hsc_baseminor,
-- 
2.16.1

