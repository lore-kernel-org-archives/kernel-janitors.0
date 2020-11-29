From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 29 Nov 2020 08:22:15 +0000
Subject: [PATCH] HID: elan: Fix some error handling path
Message-Id: <20201129082215.1453257-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com, dinghao.liu@zju.edu.cn, neko@nya.ai
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'input' is a managed resource allocated earlier in the function by:
   input = devm_input_allocate_device(&hdev->dev);

There is no need to explicitly free it. This would lead to a double
reference decrement.

Fixes: b7429ea53d6c ("HID: elan: Fix memleak in elan_input_configured")
Fixes: 9a6a4193d65b ("HID: Add driver for USB ELAN Touchpad")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-elan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index dae193749d44..8587f9d2fffb 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -188,7 +188,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	ret = input_mt_init_slots(input, ELAN_MAX_FINGERS, INPUT_MT_POINTER);
 	if (ret) {
 		hid_err(hdev, "Failed to init elan MT slots: %d\n", ret);
-		input_free_device(input);
 		return ret;
 	}
 
@@ -200,7 +199,6 @@ static int elan_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		hid_err(hdev, "Failed to register elan input device: %d\n",
 			ret);
 		input_mt_destroy_slots(input);
-		input_free_device(input);
 		return ret;
 	}
 
-- 
2.27.0
