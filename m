From: Dan Carpenter <error27@gmail.com>
Date: Mon, 29 Mar 2010 09:01:27 +0000
Subject: [patch] usb/oxu210hp: release spinlock on error path
Message-Id: <20100329090127.GE5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Anand Gadiyar <gadiyar@ti.com>, David Brownell <dbrownell@users.sourceforge.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complained about this missing spinlock.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  :/

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 50f57f4..e62b30b 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -660,13 +660,13 @@ static struct ehci_qh *oxu_qh_alloc(struct oxu_hcd *oxu)
 		if (qh->dummy = NULL) {
 			oxu_dbg(oxu, "no dummy td\n");
 			oxu->qh_used[i] = 0;
-
-			return NULL;
+			qh = NULL;
+			goto unlock;
 		}
 
 		oxu->qh_used[i] = 1;
 	}
-
+unlock:
 	spin_unlock(&oxu->mem_lock);
 
 	return qh;
