From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 05 Oct 2012 20:41:06 +0000
Subject: [PATCH 4/20 V2] drivers/net/can/sja1000/peak_pcmcia.c: fix error return code
Message-Id: <1349469667-6137-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349469667-6137-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349469667-6137-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wg@grandegger.com
Cc: mkl@pengutronix.de, linux@dominikbrodowski.net, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

The function pcan_probe() return 0 for success and negative value
for most of its internal tests failures. There is one exception
that is error case going to probe_err_4:. Fore this error case, the
function abort its success execution path but returns non negative
value, making it difficult for a caller function to notice the error.

This patch fixes the error case that do not return negative value.

This was found by Coccinelle, but the code change was made by hand.
This patch is not robot generated.

A simplified version of the semantic match that finds this problem is
as follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
Change from V1:
        Updated commit message. See:
        http://www.kernelhub.org/?p=2&msg9319

 drivers/net/can/sja1000/peak_pcmcia.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/sja1000/peak_pcmcia.c b/drivers/net/can/sja1000/peak_pcmcia.c
index ec6bd9d..272a85f 100644
--- a/drivers/net/can/sja1000/peak_pcmcia.c
+++ b/drivers/net/can/sja1000/peak_pcmcia.c
@@ -686,8 +686,10 @@ static int __devinit pcan_probe(struct pcmcia_device *pdev)
 
 	/* detect available channels */
 	pcan_add_channels(card);
-	if (!card->chan_count)
+	if (!card->chan_count) {
+		err = -ENOMEM;
 		goto probe_err_4;
+	}
 
 	/* init the timer which controls the leds */
 	init_timer(&card->led_timer);

