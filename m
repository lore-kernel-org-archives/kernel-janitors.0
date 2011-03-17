From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Thu, 17 Mar 2011 20:52:23 +0000
Subject: Re: [patch] USB: xhci: unsigned char never equals -1
Message-Id: <20110317205223.GA5399@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110317193949.GN2008@bicker>
In-Reply-To: <20110317193949.GN2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2011 at 10:47:46PM +0300, Dan Carpenter wrote:
> Btw, xhci-ring.c causes some valid looking gcc warnings:

Which git commit are you working off of?

> C [M]  drivers/usb/host/xhci-ring.o
> drivers/usb/host/xhci-ring.c: In function ‘handle_port_status’:
> drivers/usb/host/xhci-ring.c:1229: warning: ‘hcd’ may be used uninitialized in this function
> drivers/usb/host/xhci-ring.c: In function ‘handle_tx_event’:
> drivers/usb/host/xhci-ring.c:1895: warning: ‘event_trb’ may be used uninitialized in this function

I think the second warning is just the compiler getting confused, but
I'll look into the first warning.  What gcc version are you using?  I
had compile-tested the patches I recently sent to Greg, but on an older
(un-updateable, thanks Ubuntu) box with an older gcc.

Sarah Sharp
