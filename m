From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 21:14:19 +0000
Subject: [PATCH 3/3] tty/serial/ucc_uart: Fix a typo in a comment line
Message-Id: <aead07fc-fe8f-c5e5-2a40-986b022d639a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c6d363d-398b-4695-78c3-33b9e8dbffa3@users.sourceforge.net>
In-Reply-To: <5c6d363d-398b-4695-78c3-33b9e8dbffa3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Timur Tabi <timur@tabi.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 21:56:28 +0100

Add a missing character in a function name of this description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/serial/ucc_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index a9ce652899aa..d0f139d897a2 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1154,7 +1154,7 @@ static unsigned int soc_info(unsigned int *rev_h, unsigned int *rev_l)
 }
 
 /*
- * requst_firmware_nowait() callback function
+ * request_firmware_nowait() callback function
  *
  * This function is called by the kernel when a firmware is made available,
  * or if it times out waiting for the firmware.
-- 
2.15.1

