From: Thomas Meyer <thomas@m3y3r.de>
Date: Thu, 04 Aug 2011 20:51:32 +0000
Subject: [PATCH] net/usb: Use kzalloc
Message-Id: <1312491095.2629.36.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312301372.2629.10.camel@localhost.localdomain>
	 <20110803090223.GM4587@distanz.ch>
	 <CAAVPGOPbspuvS_745bPwAPuWY6_N5VQX-mUhxo=RZhZDNSn0QA@mail.gmail.com>
In-Reply-To: <CAAVPGOPbspuvS_745bPwAPuWY6_N5VQX-mUhxo=RZhZDNSn0QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julie Sullivan <kernelmail.jms@gmail.com>
Cc: Tobias Klauser <tklauser@distanz.ch>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Thomas Meyer <thomas@m3y3r.de>

 Use kzalloc rather than kmalloc followed by memset with 0

 This considers some simple cases that are common and easy to validate
 Note in particular that there are no ...s in the rule, so all of the
 matched code has to be contiguous

 The semantic patch that makes this output is available
 in scripts/coccinelle/api/alloc/kzalloc-simple.cocci.

 More information about semantic patching is available at
 http://coccinelle.lip6.fr/

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

Am Donnerstag, den 04.08.2011, 21:31 +0100 schrieb Julie Sullivan:
> I think we could do with a log message before the SOB too (like you
> did in your 'Use resource_size()' patch? :-)
> 
yes, sure! sorry! I promise to improve.

here you go:

diff -u -p a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
--- a/drivers/net/usb/cdc_ncm.c 2011-07-26 00:46:08.126846923 +0200
+++ b/drivers/net/usb/cdc_ncm.c 2011-08-01 20:20:43.396390040 +0200
@@ -479,12 +479,10 @@ static int cdc_ncm_bind(struct usbnet *d
 	int temp;
 	u8 iface_no;
 
-	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (ctx = NULL)
 		return -ENODEV;
 
-	memset(ctx, 0, sizeof(*ctx));
-
 	init_timer(&ctx->tx_timer);
 	spin_lock_init(&ctx->mtx);
 	ctx->netdev = dev->net;



