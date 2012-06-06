From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Jun 2012 21:41:36 +0000
Subject: [PATCH 2/7] drivers/staging/comedi/drivers/me4000.c: adjust suspicious bit operation
Message-Id: <1339018901-28439-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>
Cc: kernel-janitors@vger.kernel.org, Mori Hess <fmhess@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

From: Julia Lawall <Julia.Lawall@lip6.fr>

TRIG_ROUND_NEAREST is 0, so a bit-and with it is always false.  The
value TRIG_ROUND_MASK covers the bits of the TRIG_ROUND constants, so
first pick those bits and then make the test using =.

The same is done for TRIG_ROUND_UP for symmetry, even though bit-and would
be sufficient in this case.

This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <julia@diku.dk>

---
The TRIG_ROUND_UP case could be left as is, if that is preferred.  Or a
temporary variable could be introduced to avoid anding with the mask twice.

Actually, the following code suggests that the mask is not necessary, = would be sufficient:
	/* Only rounding flags are implemented */
        cmd->flags &= TRIG_ROUND_NEAREST | TRIG_ROUND_UP | TRIG_ROUND_DOWN;
But using the mask is safer, if there are future extensions.

 drivers/staging/comedi/drivers/me4000.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/drivers/me4000.c b/drivers/staging/comedi/drivers/me4000.c
index 8ca1b54..fc60117 100644
--- a/drivers/staging/comedi/drivers/me4000.c
+++ b/drivers/staging/comedi/drivers/me4000.c
@@ -949,10 +949,10 @@ static int ai_round_cmd_args(struct comedi_device *dev,
 		*init_ticks = (cmd->start_arg * 33) / 1000;
 		rest = (cmd->start_arg * 33) % 1000;
 
-		if (cmd->flags & TRIG_ROUND_NEAREST) {
+		if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_NEAREST) {
 			if (rest > 33)
 				(*init_ticks)++;
-		} else if (cmd->flags & TRIG_ROUND_UP) {
+		} else if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_UP) {
 			if (rest)
 				(*init_ticks)++;
 		}
@@ -962,10 +962,10 @@ static int ai_round_cmd_args(struct comedi_device *dev,
 		*scan_ticks = (cmd->scan_begin_arg * 33) / 1000;
 		rest = (cmd->scan_begin_arg * 33) % 1000;
 
-		if (cmd->flags & TRIG_ROUND_NEAREST) {
+		if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_NEAREST) {
 			if (rest > 33)
 				(*scan_ticks)++;
-		} else if (cmd->flags & TRIG_ROUND_UP) {
+		} else if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_UP) {
 			if (rest)
 				(*scan_ticks)++;
 		}
@@ -975,10 +975,10 @@ static int ai_round_cmd_args(struct comedi_device *dev,
 		*chan_ticks = (cmd->convert_arg * 33) / 1000;
 		rest = (cmd->convert_arg * 33) % 1000;
 
-		if (cmd->flags & TRIG_ROUND_NEAREST) {
+		if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_NEAREST) {
 			if (rest > 33)
 				(*chan_ticks)++;
-		} else if (cmd->flags & TRIG_ROUND_UP) {
+		} else if ((cmd->flags & TRIG_ROUND_MASK) = TRIG_ROUND_UP) {
 			if (rest)
 				(*chan_ticks)++;
 		}

