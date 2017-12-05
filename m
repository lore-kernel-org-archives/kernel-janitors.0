From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 20:28:11 +0000
Subject: [PATCH 2/4] uwb: Delete an error message for a failed memory allocation in whcrc_probe()
Message-Id: <2857ba10-caa2-b283-da10-e292fdc8698d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
In-Reply-To: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 20:43:31 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uwb/whc-rc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/uwb/whc-rc.c b/drivers/uwb/whc-rc.c
index 3ae3c702500d..f69511166aad 100644
--- a/drivers/uwb/whc-rc.c
+++ b/drivers/uwb/whc-rc.c
@@ -374,10 +374,9 @@ int whcrc_probe(struct umc_dev *umc_dev)
 		goto error_rc_alloc;
 	}
 	whcrc = kzalloc(sizeof(*whcrc), GFP_KERNEL);
-	if (whcrc = NULL) {
-		dev_err(dev, "unable to allocate WHC-RC instance\n");
+	if (!whcrc)
 		goto error_alloc;
-	}
+
 	whcrc_init(whcrc);
 	whcrc->umc_dev = umc_dev;
 
-- 
2.15.1

