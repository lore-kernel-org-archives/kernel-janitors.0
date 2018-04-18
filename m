From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Apr 2018 11:35:28 +0000
Subject: [PATCH] tty: nozomi: fix spelling mistake in macro NOZOMI_STATE_UKNOWN
Message-Id: <20180418113528.1468-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Rename NOZOMI_STATE_UKNOWN to NOZOMI_STATE_UNKNOWN (add missing N)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/nozomi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/nozomi.c b/drivers/tty/nozomi.c
index b57b35066ebe..bf05946d80a1 100644
--- a/drivers/tty/nozomi.c
+++ b/drivers/tty/nozomi.c
@@ -155,7 +155,7 @@ enum card_type {
 
 /* Initialization states a card can be in */
 enum card_state {
-	NOZOMI_STATE_UKNOWN	= 0,
+	NOZOMI_STATE_UNKNOWN	= 0,
 	NOZOMI_STATE_ENABLED	= 1,	/* pci device enabled */
 	NOZOMI_STATE_ALLOCATED	= 2,	/* config setup done */
 	NOZOMI_STATE_READY	= 3,	/* flowcontrols received */
-- 
2.17.0

