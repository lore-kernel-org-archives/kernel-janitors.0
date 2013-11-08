From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:53:48 +0000
Subject: [patch] serial: icom: dereference after free in load_code()
Message-Id: <20131108095348.GL27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

We use "fw" in the next line after we release it.  I've shifted the call
to release_firmware() down a couple lines to fix this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/serial/icom.c b/drivers/tty/serial/icom.c
index d98e433..6742380 100644
--- a/drivers/tty/serial/icom.c
+++ b/drivers/tty/serial/icom.c
@@ -455,11 +455,11 @@ static void load_code(struct icom_port *icom_port)
 	for (index = 0; index < fw->size; index++)
 		new_page[index] = fw->data[index];
 
-	release_firmware(fw);
-
 	writeb((char) ((fw->size + 16)/16), &icom_port->dram->mac_length);
 	writel(temp_pci, &icom_port->dram->mac_load_addr);
 
+	release_firmware(fw);
+
 	/*Setting the syncReg to 0x80 causes adapter to start downloading
 	   the personality code into adapter instruction RAM.
 	   Once code is loaded, it will begin executing and, based on
