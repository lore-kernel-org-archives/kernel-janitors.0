From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 09:59:48 +0000
Subject: [PATCH] Bluetooth: hci_qca: Fix an error pointer dereference
Message-Id: <20200529095948.GA1304852@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Rocky Liao <rjliao@codeaurora.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

When a function like devm_clk_get_optional() function returns both error
pointers on error and NULL then the NULL return means that the optional
feature is deliberately disabled.  It is a special sort of success and
should not trigger an error message.  The surrounding code should be
written to check for NULL and not crash.

On the other hand, if we encounter an error, then the probe from should
clean up and return a failure.

In this code, if devm_clk_get_optional() returns an error pointer then
the kernel will crash inside the call to:

	clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);

The error handling must be updated to prevent that.

Fixes: 77131dfec6af ("Bluetooth: hci_qca: Replace devm_gpiod_get() with devm_gpiod_get_optional()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Commit 77131dfec6af ("Bluetooth: hci_qca: Replace devm_gpiod_get() with
devm_gpiod_get_optional()") changed how qcadev->bt_en is handled as
well.  From a very strict perspective the new code is buggy because the
warnings should only be printed for error pointers, but currently errors
are ignored and warnings are printed for NULL.

However this bug does not lead to a crash so I have left it as is.

 drivers/bluetooth/hci_qca.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a68238fcb93..5738ab062a733 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1926,17 +1926,17 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
-		if (!qcadev->susclk) {
+		if (IS_ERR(qcadev->susclk)) {
 			dev_warn(&serdev->dev, "failed to acquire clk\n");
-		} else {
-			err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
-			if (err)
-				return err;
-
-			err = clk_prepare_enable(qcadev->susclk);
-			if (err)
-				return err;
+			return PTR_ERR(qcadev->susclk);
 		}
+		err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
+		if (err)
+			return err;
+
+		err = clk_prepare_enable(qcadev->susclk);
+		if (err)
+			return err;
 
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
-- 
2.26.2
