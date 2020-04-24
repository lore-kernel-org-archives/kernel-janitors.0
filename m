From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:35:06 +0000
Subject: [PATCH] usb: gadget: function: remove redundant assignment to variable 'status'
Message-Id: <20200424113506.12930-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being assigned a value that is never read
and it is being updated later with a new value. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/function/f_eem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index b81a91d504bd..cfcc4e81fb77 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -291,8 +291,6 @@ static int eem_bind(struct usb_configuration *c, struct usb_function *f)
 		goto fail;
 	eem->port.out_ep = ep;
 
-	status = -ENOMEM;
-
 	/* support all relevant hardware speeds... we expect that when
 	 * hardware is dual speed, all bulk-capable endpoints work at
 	 * both speeds
-- 
2.25.1
