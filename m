From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 14:14:51 +0000
Subject: [PATCH] serial: mvebu-uart: remove duplicated bit-wise or of STAT_FRM_ERR
Message-Id: <20180223141451.28957-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Bit pattern STAT_FRM_ERR is being bit-wise or'd twice; remove the
redundant 2nd STAT_FRM_ERR

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/serial/mvebu-uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index a100e98259d7..ec3d4e3dab29 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -65,7 +65,7 @@
 #define  STAT_FRM_ERR		BIT(2)
 #define  STAT_PAR_ERR		BIT(1)
 #define  STAT_OVR_ERR		BIT(0)
-#define  STAT_BRK_ERR		(STAT_BRK_DET | STAT_FRM_ERR | STAT_FRM_ERR\
+#define  STAT_BRK_ERR		(STAT_BRK_DET | STAT_FRM_ERR \
 				 | STAT_PAR_ERR | STAT_OVR_ERR)
 
 #define UART_BRDV		0x10
-- 
2.15.1

