From: Andre Haupt <andre@bitwigglers.org>
Date: Thu, 13 Dec 2007 14:08:04 +0000
Subject: [PATCH][KJ] 8250: remove unnecessary variable tmout from  wait_for_xmitr()
Message-Id: <11975548843528-git-send-email-andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: n
In-Reply-To: n
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andre Haupt <andre@bitwigglers.org>

This fixes a sparse warning about symbol tmout shadowing an earlier one.

Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/serial/8250.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
index f94109c..284757d 100644
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@ -1727,7 +1727,6 @@ static inline void wait_for_xmitr(struct uart_8250_port *up, int bits)
 
 	/* Wait up to 1s for flow control if necessary */
 	if (up->port.flags & UPF_CONS_FLOW) {
-		unsigned int tmout;
 		for (tmout = 1000000; tmout; tmout--) {
 			unsigned int msr = serial_in(up, UART_MSR);
 			up->msr_saved_flags |= msr & MSR_SAVE_FLAGS;
-- 
1.4.4.4

