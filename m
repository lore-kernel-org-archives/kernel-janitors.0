From: Dan Carpenter <error27@gmail.com>
Date: Mon, 25 Oct 2010 05:28:03 +0000
Subject: [patch] serial/mrst_max3110: make buffer larger
Message-Id: <20101025052802.GY5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alan Cox <alan@linux.intel.com>, Feng Tang <feng.tang@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is used to store the spi_device ->modalias so they have to be the same
size.  SPI_NAME_SIZE is 32.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/serial/mrst_max3110.c b/drivers/serial/mrst_max3110.c
index b62857b..37e13c3 100644
--- a/drivers/serial/mrst_max3110.c
+++ b/drivers/serial/mrst_max3110.c
@@ -51,7 +51,7 @@
 struct uart_max3110 {
 	struct uart_port port;
 	struct spi_device *spi;
-	char name[24];
+	char name[SPI_NAME_SIZE];
 
 	wait_queue_head_t wq;
 	struct task_struct *main_thread;
