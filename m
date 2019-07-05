From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 08:32:46 +0000
Subject: [PATCH] [media] saa7134: remove redundant assignment to variable value
Message-Id: <20190705083246.15849-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable value is being assigned with a value that is never
read and it is being updated later with a new value. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/saa7134/saa7134-tvaudio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-tvaudio.c b/drivers/media/pci/saa7134/saa7134-tvaudio.c
index 5beff534d5e1..79e1afb71075 100644
--- a/drivers/media/pci/saa7134/saa7134-tvaudio.c
+++ b/drivers/media/pci/saa7134/saa7134-tvaudio.c
@@ -319,7 +319,6 @@ static int tvaudio_checkcarrier(struct saa7134_dev *dev, struct mainscan *scan)
 	__s32 left,right,value;
 
 	if (!(dev->tvnorm->id & scan->std)) {
-		value = 0;
 		audio_dbg(1, "skipping %d.%03d MHz [%4s]\n",
 			  scan->carr / 1000, scan->carr % 1000, scan->name);
 		return 0;
-- 
2.20.1
