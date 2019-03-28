From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:40:56 +0000
Subject: [PATCH] NFC: pn533: potential buffer overflow in pn533_target_found_type_a()
Message-Id: <20190328144056.GR32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch doesn't trust information that comes from skb->data.  It
complains that "nfc_tgt->nfcid1_len" is a u8 so it could be up to 255
bytes, but the destination buffer is only 10 bytes large.

Fixes: c3b1e1e8a76f ("NFC: Export NFCID1 from pn533")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nfc/pn533/pn533.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index a0cc1cc45292..9f9bbf912687 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -724,6 +724,8 @@ static int pn533_target_found_type_a(struct nfc_target *nfc_tgt, u8 *tgt_data,
 	nfc_tgt->sens_res = be16_to_cpu(tgt_type_a->sens_res);
 	nfc_tgt->sel_res = tgt_type_a->sel_res;
 	nfc_tgt->nfcid1_len = tgt_type_a->nfcid_len;
+	if (nfc_tgt->nfcid1_len > sizeof(nfc_tgt->nfcid1))
+		return -EINVAL;
 	memcpy(nfc_tgt->nfcid1, tgt_type_a->nfcid_data, nfc_tgt->nfcid1_len);
 
 	return 0;
-- 
2.17.1
