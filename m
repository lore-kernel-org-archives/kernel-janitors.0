From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 01:03:44 +0000
Subject: [PATCH] staging: comedi: drivers: fix spelling mistake "to" -> "too"
Message-Id: <20200123010344.2834618-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a deb_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/das6402.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/das6402.c b/drivers/staging/comedi/drivers/das6402.c
index f99211ec46de..04e224f8b779 100644
--- a/drivers/staging/comedi/drivers/das6402.c
+++ b/drivers/staging/comedi/drivers/das6402.c
@@ -279,7 +279,7 @@ static int das6402_ai_check_chanlist(struct comedi_device *dev,
 
 		if (aref0 = AREF_DIFF && chan > (s->n_chan / 2)) {
 			dev_dbg(dev->class_dev,
-				"chanlist differential channel to large\n");
+				"chanlist differential channel too large\n");
 			return -EINVAL;
 		}
 	}
-- 
2.24.0
