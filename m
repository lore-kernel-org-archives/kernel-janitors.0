From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 14:54:45 +0000
Subject: [PATCH] drivers/serial/s3c2410.c: remove dead config symbols
Message-Id: <47332335.7080303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbol
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 drivers/serial/s3c2410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/s3c2410.c b/drivers/serial/s3c2410.c
index e773c8e..45de193 100644
--- a/drivers/serial/s3c2410.c
+++ b/drivers/serial/s3c2410.c
@@ -1527,7 +1527,7 @@ static inline void s3c2440_serial_exit(void)
 #define s3c2440_uart_inf_at NULL
 #endif /* CONFIG_CPU_S3C2440 */
 
-#if defined(CONFIG_CPU_S3C2412) || defined(CONFIG_CPU_S3C2413)
+#if defined(CONFIG_CPU_S3C2412)
 
 static int s3c2412_serial_setsource(struct uart_port *port,
 				     struct s3c24xx_uart_clksrc *clk)
