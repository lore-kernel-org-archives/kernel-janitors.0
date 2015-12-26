From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 26 Dec 2015 21:57:44 +0000
Subject: [PATCH 2/2] USB: usbmon: remove assignment from IS_ERR argument
Message-Id: <1451167064-2288-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451167064-2288-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451167064-2288-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S1,S2;
@@

+e1 = e2;
if (IS_ERR(
    e1
-   = e2
   )) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/mon/mon_text.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
index 98e4f63..e59334b 100644
--- a/drivers/usb/mon/mon_text.c
+++ b/drivers/usb/mon/mon_text.c
@@ -387,7 +387,8 @@ static ssize_t mon_text_read_t(struct file *file, char __user *buf,
 	struct mon_event_text *ep;
 	struct mon_text_ptr ptr;
 
-	if (IS_ERR(ep = mon_text_read_wait(rp, file)))
+	ep = mon_text_read_wait(rp, file);
+	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 	mutex_lock(&rp->printf_lock);
 	ptr.cnt = 0;
@@ -414,7 +415,8 @@ static ssize_t mon_text_read_u(struct file *file, char __user *buf,
 	struct mon_event_text *ep;
 	struct mon_text_ptr ptr;
 
-	if (IS_ERR(ep = mon_text_read_wait(rp, file)))
+	ep = mon_text_read_wait(rp, file);
+	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 	mutex_lock(&rp->printf_lock);
 	ptr.cnt = 0;

