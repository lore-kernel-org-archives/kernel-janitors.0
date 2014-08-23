From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 18:33:26 +0000
Subject: [PATCH 5/7] wusb: delete double assignment
Message-Id: <1408818808-18850-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

 drivers/usb/wusbcore/crypto.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/wusbcore/crypto.c b/drivers/usb/wusbcore/crypto.c
index 9a95b2d..50ce80d 100644
--- a/drivers/usb/wusbcore/crypto.c
+++ b/drivers/usb/wusbcore/crypto.c
@@ -222,8 +222,6 @@ static int wusb_ccm_mac(struct crypto_blkcipher *tfm_cbc,
 	WARN_ON(sizeof(ax) != sizeof(struct aes_ccm_block));
 
 	result = -ENOMEM;
-	zero_padding = sizeof(struct aes_ccm_block)
-		- blen % sizeof(struct aes_ccm_block);
 	zero_padding = blen % sizeof(struct aes_ccm_block);
 	if (zero_padding)
 		zero_padding = sizeof(struct aes_ccm_block) - zero_padding;

