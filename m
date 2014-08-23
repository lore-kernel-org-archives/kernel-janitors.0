From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 11:20:26 +0000
Subject: [PATCH 4/9] NFC: use c99 initializers in structures
Message-Id: <1408792831-25615-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: josh@joshtriplett.org, kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use c99 initializers for structures.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@bad@
identifier decl.i1,i2;
expression e;
initializer list[decl.n] is;
@@

struct i1 i2 = { is,
+ .fld = e
- e
 ,...};
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

 drivers/nfc/nfcwilink.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcwilink.c b/drivers/nfc/nfcwilink.c
index 683671a..e83df00 100644
--- a/drivers/nfc/nfcwilink.c
+++ b/drivers/nfc/nfcwilink.c
@@ -461,7 +461,11 @@ static int nfcwilink_close(struct nci_dev *ndev)
 static int nfcwilink_send(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	struct nfcwilink *drv = nci_get_drvdata(ndev);
-	struct nfcwilink_hdr hdr = {NFCWILINK_CHNL, NFCWILINK_OPCODE, 0x0000};
+	struct nfcwilink_hdr hdr = {
+		.chnl = NFCWILINK_CHNL,
+		.opcode = NFCWILINK_OPCODE,
+		.len = 0x0000
+	};
 	long len;
 
 	dev_dbg(&drv->pdev->dev, "send entry, len %d\n", skb->len);

