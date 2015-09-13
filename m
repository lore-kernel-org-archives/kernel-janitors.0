From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 13:44:13 +0000
Subject: [PATCH] serial: sccnxp: convert devm irq to non devm version
Message-Id: <1442151853-16186-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org

There seems to be no need to request an irq with a devm function, since the
irq is being freed explicitly.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

Compile tested only.

 drivers/tty/serial/sccnxp.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index fcf803f..d0d5fa9 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -963,11 +963,9 @@ static int sccnxp_probe(struct platform_device *pdev)
 	sccnxp_write(&s->port[0], SCCNXP_IMR_REG, 0);
 
 	if (!s->poll) {
-		ret = devm_request_threaded_irq(&pdev->dev, s->irq, NULL,
-						sccnxp_ist,
-						IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
-						dev_name(&pdev->dev), s);
+		ret = request_threaded_irq(s->irq, NULL, sccnxp_ist,
+					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					   dev_name(&pdev->dev), s);
 		if (!ret)
 			return 0;
 
@@ -994,7 +992,7 @@ static int sccnxp_remove(struct platform_device *pdev)
 	struct sccnxp_port *s = platform_get_drvdata(pdev);
 
 	if (!s->poll)
-		devm_free_irq(&pdev->dev, s->irq, s);
+		free_irq(s->irq, s);
 	else
 		del_timer_sync(&s->timer);
 

