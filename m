From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Nov 2017 10:01:22 +0000
Subject: [PATCH] USB: c67x00: remove redundant pointer urbp
Message-Id: <20171101100122.17311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Korsgaard <jacmet@sunsite.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer urbp is assigned but is never read, hence it is redundant
and can be removed. Cleans up clang warning:

drivers/usb/c67x00/c67x00-sched.c:975:2: warning: Value stored to 'urbp'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/c67x00/c67x00-sched.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index 7311ed61e99a..0b68cd6874d2 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -966,13 +966,11 @@ static void c67x00_handle_successful_td(struct c67x00_hcd *c67x00,
 static void c67x00_handle_isoc(struct c67x00_hcd *c67x00, struct c67x00_td *td)
 {
 	struct urb *urb = td->urb;
-	struct c67x00_urb_priv *urbp;
 	int cnt;
 
 	if (!urb)
 		return;
 
-	urbp = urb->hcpriv;
 	cnt = td->privdata;
 
 	if (td->status & TD_ERROR_MASK)
-- 
2.14.1

