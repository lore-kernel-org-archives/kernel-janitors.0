From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:36:23 +0000
Subject: [PATCH 26/42] drivers/spi/amba-pl022.c: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052235400.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <921858.63779.qm@web180313.mail.gq1.yahoo.com>
In-Reply-To: <921858.63779.qm-4JhmkcZgSkn6X00i2u5GFvu2YVrzzGjVVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Julia Lawall <julia@diku.dk>

The return -EINVAL appears to only make sense if the if branch that it is
aligned with is taken, so move it into that branch

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This patch changes the semantics, and the change might not be correct.

 drivers/spi/amba-pl022.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/amba-pl022.c b/drivers/spi/amba-pl022.c
index f0a1418..4de50de 100644
--- a/drivers/spi/amba-pl022.c
+++ b/drivers/spi/amba-pl022.c
@@ -1348,10 +1348,11 @@ static int verify_controller_parameters(struct pl022 *pl022,
 			if ((chip_info->duplex ! 			     SSP_MICROWIRE_CHANNEL_FULL_DUPLEX)
 			    && (chip_info->duplex !-				SSP_MICROWIRE_CHANNEL_HALF_DUPLEX))
+				SSP_MICROWIRE_CHANNEL_HALF_DUPLEX)) {
 				dev_err(chip_info->dev,
 					"Microwire duplex mode is configured incorrectly\n");
 				return -EINVAL;
+			}
 		} else {
 			if (chip_info->duplex != SSP_MICROWIRE_CHANNEL_FULL_DUPLEX)
 				dev_err(chip_info->dev,
