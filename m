From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:34:00 +0000
Subject: [PATCH 5/9] drivers/spi: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032333440.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>, Grant Likely <grant.likely@secretlab.ca>, spi-devel-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger

From: Julia Lawall <julia@diku.dk>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E;
@@

I(x,...) { <...
- (x != NULL) &&
  E
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/spi/orion_spi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/orion_spi.c b/drivers/spi/orion_spi.c
index 3aea50d..0b677dc 100644
--- a/drivers/spi/orion_spi.c
+++ b/drivers/spi/orion_spi.c
@@ -404,7 +404,7 @@ static int orion_spi_transfer(struct spi_device *spi, struct spi_message *m)
 			goto msg_rejected;
 		}
 
-		if ((t != NULL) && t->bits_per_word)
+		if (t->bits_per_word)
 			bits_per_word = t->bits_per_word;
 
 		if ((bits_per_word != 8) && (bits_per_word != 16)) {
@@ -415,7 +415,7 @@ static int orion_spi_transfer(struct spi_device *spi, struct spi_message *m)
 			goto msg_rejected;
 		}
 		/*make sure buffer length is even when working in 16 bit mode*/
-		if ((t != NULL) && (t->bits_per_word = 16) && (t->len & 1)) {
+		if ((t->bits_per_word = 16) && (t->len & 1)) {
 			dev_err(&spi->dev,
 				"message rejected : "
 				"odd data length (%d) while in 16 bit mode\n",
