From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Mar 2011 19:47:46 +0000
Subject: Re: [patch] USB: xhci: unsigned char never equals -1
Message-Id: <20110317194746.GO2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110317193949.GN2008@bicker>
In-Reply-To: <20110317193949.GN2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Btw, xhci-ring.c causes some valid looking gcc warnings:

C [M]  drivers/usb/host/xhci-ring.o
drivers/usb/host/xhci-ring.c: In function ‘handle_port_status’:
drivers/usb/host/xhci-ring.c:1229: warning: ‘hcd’ may be used uninitialized in this function
drivers/usb/host/xhci-ring.c: In function ‘handle_tx_event’:
drivers/usb/host/xhci-ring.c:1895: warning: ‘event_trb’ may be used uninitialized in this function

regards,
dan carpenter
