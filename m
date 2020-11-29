From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 29 Nov 2020 08:45:16 +0000
Subject: [PATCH] Input: Fix a ref counting issue
Message-Id: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, rydberg@euromail.se, tj@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of a managed resource, 'devm_input_device_release()' already has a
'input_put_device(dev)' call.

Avoid a double reference decrement by explicitly calling
'input_put_device()' only on non-managed input device.

Fixes: 2be975c6d920 ("Input: introduce managed input devices (add devres support)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative and compile tested only.
---
 drivers/input/input.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3cfd2c18eebd..c09c9f020667 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1920,7 +1920,8 @@ void input_free_device(struct input_dev *dev)
 						devm_input_device_release,
 						devm_input_device_match,
 						dev));
-		input_put_device(dev);
+		else
+			input_put_device(dev);
 	}
 }
 EXPORT_SYMBOL(input_free_device);
-- 
2.27.0
