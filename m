From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2020 13:27:44 +0000
Subject: [PATCH] tty: serial: qcom_geni_serial: Clean up an ARRAY_SIZE() vs sizeof()
Message-Id: <20200624132744.GD9972@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

The ARRAY_SIZE() is the number of elements but we want the number of
bytes so sizeof() is more appropriate.  Fortunately, it's the same
thing here because this is an array of u8 so this doesn't change
runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 457c0bf8cbf8..1ed3d354e16d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -718,7 +718,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		u8 buf[sizeof(u32)];
 		int c;
 
-		memset(buf, 0, ARRAY_SIZE(buf));
+		memset(buf, 0, sizeof(buf));
 		tx_bytes = min_t(size_t, remaining, port->tx_bytes_pw);
 
 		for (c = 0; c < tx_bytes ; c++) {
-- 
2.27.0
