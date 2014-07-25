From: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Date: Fri, 25 Jul 2014 18:30:49 +0000
Subject: [PATCH] drivers/media/pci/solo6x10/solo6x10-disp.c: check kzalloc() result
Message-Id: <1406313049-9604-1-git-send-email-andrey.utkin@corp.bluecherry.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.chehab@samsung.com, hans.verkuil@cisco.com, khalasa@piap.pl, ismael.luceno@corp.bluecherry.net
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrey Utkin <andrey.utkin@corp.bluecherry.net>

Signed-off-by: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
---
 drivers/media/pci/solo6x10/solo6x10-disp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/solo6x10/solo6x10-disp.c b/drivers/media/pci/solo6x10/solo6x10-disp.c
index ed88ab4..93cbbb1 100644
--- a/drivers/media/pci/solo6x10/solo6x10-disp.c
+++ b/drivers/media/pci/solo6x10/solo6x10-disp.c
@@ -216,6 +216,8 @@ int solo_set_motion_block(struct solo_dev *solo_dev, u8 ch,
 	int ret = 0;
 
 	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	for (y = 0; y < SOLO_MOTION_SZ; y++) {
 		for (x = 0; x < SOLO_MOTION_SZ; x++)
 			buf[x] = cpu_to_le16(thresholds[y * SOLO_MOTION_SZ + x]);
-- 
1.8.5.5

