From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 10:07:45 +0000
Subject: [PATCH] usb: host: u132-hcd: fix spelling mistake "overcurren" -> "overcurrent"
Message-Id: <20190911100745.30711-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a module parameter description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/u132-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 4efee34f154f..e9209e3e6248 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -71,7 +71,7 @@ INT_MODULE_PARM(testing, 0);
 /* Some boards misreport power switching/overcurrent*/
 static bool distrust_firmware = true;
 module_param(distrust_firmware, bool, 0);
-MODULE_PARM_DESC(distrust_firmware, "true to distrust firmware power/overcurren"
+MODULE_PARM_DESC(distrust_firmware, "true to distrust firmware power/overcurrent"
 	"t setup");
 static DECLARE_WAIT_QUEUE_HEAD(u132_hcd_wait);
 /*
-- 
2.20.1
