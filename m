From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 09 Jan 2017 00:26:37 +0000
Subject: [PATCH] tty: goldfish: Fix a parameter of a call to free_irq
Message-Id: <20170109002637.9212-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jslaby@suse.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'request_irq()' and 'free_irq()' should be called with the same dev_id.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/tty/goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/goldfish.c b/drivers/tty/goldfish.c
index 3fc912373adf..996bd473dd03 100644
--- a/drivers/tty/goldfish.c
+++ b/drivers/tty/goldfish.c
@@ -300,7 +300,7 @@ static int goldfish_tty_probe(struct platform_device *pdev)
 	return 0;
 
 err_tty_register_device_failed:
-	free_irq(irq, pdev);
+	free_irq(irq, qtty);
 err_request_irq_failed:
 	goldfish_tty_current_line_count--;
 	if (goldfish_tty_current_line_count = 0)
-- 
2.9.3

