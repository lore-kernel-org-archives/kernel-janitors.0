From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 21:43:31 +0000
Subject: [PATCH] media: mantis_dvb: remove redundant initialization to variable result
Message-Id: <20200507214331.65790-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/mantis/mantis_dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
index e78ca1f26e68..2da94be5b373 100644
--- a/drivers/media/pci/mantis/mantis_dvb.c
+++ b/drivers/media/pci/mantis/mantis_dvb.c
@@ -135,7 +135,7 @@ static int mantis_dvb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 int mantis_dvb_init(struct mantis_pci *mantis)
 {
 	struct mantis_hwconfig *config = mantis->hwconfig;
-	int result = -1;
+	int result;
 
 	dprintk(MANTIS_DEBUG, 1, "dvb_register_adapter");
 
-- 
2.25.1
