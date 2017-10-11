From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Oct 2017 09:09:57 +0000
Subject: [PATCH] usb: typec: wcove: fix uninitialized usbc_irq1 and usbc_irq2
Message-Id: <20171011090957.16499-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Calls to regmap_read may fail with an -EINVAL return without setting
usbc_irq1 and usbc_irq2.  The error handling clean up expects these
to have been set (or zero on a failure) and currently may try to
clear the wrong IRQs if the uninitalized garbage values in usbc_irq1
or usbc_irq2 are non-zero.  The simplest fix is to ensure these
variables are initialized to zero.

Detected by CoverityScan, CID#1457737 ("Uninitialized scalar variable")

Fixes: 3c4fb9f16921 ("usb: typec: wcove: start using tcpm for USB PD support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/typec_wcove.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/typec_wcove.c b/drivers/usb/typec/typec_wcove.c
index a47a93ad34b7..4ce30a967962 100644
--- a/drivers/usb/typec/typec_wcove.c
+++ b/drivers/usb/typec/typec_wcove.c
@@ -441,8 +441,8 @@ static int wcove_read_rx_buffer(struct wcove_typec *wcove, void *msg)
 static irqreturn_t wcove_typec_irq(int irq, void *data)
 {
 	struct wcove_typec *wcove = data;
-	unsigned int usbc_irq1;
-	unsigned int usbc_irq2;
+	unsigned int usbc_irq1 = 0;
+	unsigned int usbc_irq2 = 0;
 	unsigned int cc1ctrl;
 	int ret;
 
-- 
2.14.1

