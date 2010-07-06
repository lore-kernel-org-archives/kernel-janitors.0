From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 06 Jul 2010 15:28:07 +0000
Subject: [PATCH] enclosure: fix lost return
Message-Id: <1278430088-9761-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: James Bottomley <James.Bottomley@suse.de>, Tejun Heo <tj@kernel.org>, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

Useless statement must be return with argument.

This patch silences a compiler warning:
drivers/misc/enclosure.c: In function ‘enclosure_component_register’:
drivers/misc/enclosure.c:289: warning: ignoring return value of ‘ERR_PTR’, declared with attribute warn_unused_result

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/misc/enclosure.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/misc/enclosure.c b/drivers/misc/enclosure.c
index 48c84a5..9ae7bef 100644
--- a/drivers/misc/enclosure.c
+++ b/drivers/misc/enclosure.c
@@ -286,7 +286,7 @@ enclosure_component_register(struct enclosure_device *edev,
 
 	err = device_register(cdev);
 	if (err)
-		ERR_PTR(err);
+		return ERR_PTR(err);
 
 	return ecomp;
 }
-- 
1.7.0.4

