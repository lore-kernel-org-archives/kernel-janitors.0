From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:09:52 +0000
Subject: [PATCH 02/17] spi: Adjust checks for null pointers in two functions
Message-Id: <1e19b52a-119a-d52c-3a54-0a533ac5b6db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 13:23:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8c05f27bf642..d8d273545e54 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -816,7 +816,7 @@ static int __spi_map_msg(struct spi_master *master, str=
uct spi_message *msg)
 		if (!master->can_dma(master, msg->spi, xfer))
 			continue;
=20
-		if (xfer->tx_buf !=3D NULL) {
+		if (xfer->tx_buf) {
 			ret =3D spi_map_buf(master, tx_dev, &xfer->tx_sg,
 					  (void *)xfer->tx_buf, xfer->len,
 					  DMA_TO_DEVICE);
@@ -824,7 +824,7 @@ static int __spi_map_msg(struct spi_master *master, str=
uct spi_message *msg)
 				return ret;
 		}
=20
-		if (xfer->rx_buf !=3D NULL) {
+		if (xfer->rx_buf) {
 			ret =3D spi_map_buf(master, rx_dev, &xfer->rx_sg,
 					  xfer->rx_buf, xfer->len,
 					  DMA_FROM_DEVICE);
@@ -3133,7 +3133,7 @@ static int of_spi_notify(struct notifier_block *nb, u=
nsigned long action,
 	switch (of_reconfig_get_state_change(action, arg)) {
 	case OF_RECONFIG_CHANGE_ADD:
 		master =3D of_find_spi_master_by_node(rd->dn->parent);
-		if (master =3D NULL)
+		if (!master)
 			return NOTIFY_OK;	/* not for us */
=20
 		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED)) {
@@ -3159,7 +3159,7 @@ static int of_spi_notify(struct notifier_block *nb, u=
nsigned long action,
=20
 		/* find our device by node */
 		spi =3D of_find_spi_device_by_node(rd->dn);
-		if (spi =3D NULL)
+		if (!spi)
 			return NOTIFY_OK;	/* no? not meant for us */
=20
 		/* unregister takes one ref away */
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
