From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 12:06:52 +0000
Subject: [PATCH] HID: elan: Do not explicitly free managed resource
Message-Id: <20200412120652.9969-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com, neko@nya.ai
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'input' is allocated with 'devm_input_allocate_device()'. There is no need
to free it explicitly. (add should it be 'devm_input_device_release()'
should be used for that)

Fixes: 9a6a4193d65b ("HID: Add driver for USB ELAN Touchpad")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-elan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 45c4f888b7c4..26c294a7c9ff 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -198,7 +198,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	if (ret) {
 		hid_err(hdev, "Failed to register elan input device: %d\n",
 			ret);
-		input_free_device(input);
 		return ret;
 	}
 
-- 
2.20.1
