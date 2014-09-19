From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 10:43:11 +0000
Subject: [patch 1/2] staging: vt6655: buffer overflow in ioctl
Message-Id: <20140919104311.GB26391@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

->u.generic_elem.len is a user controlled number between 0-255.  We
should limit it to avoid memory corruption.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6655/hostap.c b/drivers/staging/vt6655/hostap.c
index 0dd87d4..73429f4 100644
--- a/drivers/staging/vt6655/hostap.c
+++ b/drivers/staging/vt6655/hostap.c
@@ -341,6 +341,9 @@ static int hostap_set_generic_element(struct vnt_private *pDevice,
 {
 	PSMgmtObject    pMgmt = pDevice->pMgmt;
 
+	if (param->u.generic_elem.len > sizeof(pMgmt->abyWPAIE))
+		return -EINVAL;
+
 	memcpy(pMgmt->abyWPAIE,
 	       param->u.generic_elem.data,
 	       param->u.generic_elem.len
