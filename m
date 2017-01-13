From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:24:22 +0000
Subject: [PATCH 14/17] spi/topcliff-pch: Adjust six checks for null pointers
Message-Id: <676a6351-ec06-9744-9f6f-753feb65f8fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 16:16:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-topcliff-pch.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index 0a876311b67b..e4f1f66b751b 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -531,12 +531,11 @@ static int pch_spi_transfer(struct spi_device *pspi, =
struct spi_message *pmsg)
 static inline void pch_spi_select_chip(struct pch_spi_data *data,
 				       struct spi_device *pspi)
 {
-	if (data->current_chip !=3D NULL) {
+	if (data->current_chip)
 		if (pspi->chip_select !=3D data->n_curnt_chip) {
 			dev_dbg(&pspi->dev, "%s : different slave\n", __func__);
 			data->current_chip =3D NULL;
 		}
-	}
=20
 	data->current_chip =3D pspi;
=20
@@ -583,7 +582,7 @@ static void pch_spi_set_tx(struct pch_spi_data *data, i=
nt *bpw)
=20
 	/* allocate memory for pkt_tx_buff & pkt_rx_buffer */
 	data->pkt_tx_buff =3D kzalloc(size, GFP_KERNEL);
-	if (data->pkt_tx_buff !=3D NULL) {
+	if (data->pkt_tx_buff) {
 		data->pkt_rx_buff =3D kzalloc(size, GFP_KERNEL);
 		if (!data->pkt_rx_buff)
 			kfree(data->pkt_tx_buff);
@@ -605,7 +604,7 @@ static void pch_spi_set_tx(struct pch_spi_data *data, i=
nt *bpw)
 	}
=20
 	/* copy Tx Data */
-	if (data->cur_trans->tx_buf !=3D NULL) {
+	if (data->cur_trans->tx_buf) {
 		if (*bpw =3D 8) {
 			tx_buf =3D data->cur_trans->tx_buf;
 			for (j =3D 0; j < data->bpw_len; j++)
@@ -965,7 +964,7 @@ static void pch_spi_handle_dma(struct pch_spi_data *dat=
a, int *bpw)
 	}
=20
 	/* copy Tx Data */
-	if (data->cur_trans->tx_buf !=3D NULL) {
+	if (data->cur_trans->tx_buf) {
 		if (*bpw =3D 8) {
 			tx_buf =3D data->cur_trans->tx_buf;
 			tx_dma_buf =3D dma->tx_buf_virt;
@@ -1176,7 +1175,7 @@ static void pch_spi_process_messages(struct work_stru=
ct *pwork)
 		transfer structure from the message otherwise retrieve
 		the 1st transfer request from the message. */
 		spin_lock(&data->lock);
-		if (data->cur_trans =3D NULL) {
+		if (!data->cur_trans) {
 			data->cur_trans  				list_entry(data->current_msg->transfers.next,
 					   struct spi_transfer, transfer_list);
@@ -1247,9 +1246,7 @@ static void pch_spi_process_messages(struct work_stru=
ct *pwork)
 		}
=20
 		spin_unlock(&data->lock);
-
-	} while (data->cur_trans !=3D NULL);
-
+	} while (data->cur_trans);
 out:
 	pch_spi_writereg(data->master, PCH_SSNXCR, SSN_HIGH);
 	if (data->use_dma)
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
