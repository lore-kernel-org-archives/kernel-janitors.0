From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 14:54:35 +0000
Subject: [PATCH] HID: logitech-hidpp: avoid duplicate error handling code in 'hidpp_probe()'
Message-Id: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'hid_hw_stop()' is already in the error handling path when branching to
the 'hid_hw_open_fail' label.
There is no point in calling it twice, so remove one.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-logitech-hidpp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index bb063e7d48df..70e1cb928bf0 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3817,7 +3817,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret < 0) {
 		dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
 			__func__, ret);
-		hid_hw_stop(hdev);
 		goto hid_hw_open_fail;
 	}
 
-- 
2.20.1
