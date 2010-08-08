From: David Miller <davem@davemloft.net>
Date: Sun, 08 Aug 2010 05:34:12 +0000
Subject: Re: [PATCH 07/18] isdn: avm: call disable_pci_device() if
Message-Id: <20100807.223412.212426246.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281124303-13537-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281124303-13537-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, isdn@linux-pingi.de, adobriyan@gmail.com, tilman@imap.cc, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  6 Aug 2010 23:51:41 +0400

> Driver should call disable_pci_device() if it returns from pci_probe()

"pci_disable_device()"

> with error. Also it must not be called if request_region() fails as
> it means that somebody uses device resources and rules the device.

This interface, frankly, sucks.

If this is what we want then pci_enable_device() and
pci_disable_device() should maintain a reference count,
so that device drivers need not be mindful of what
arbitrary special circumstances they should make the
disable call or not.  They can make it unconditionally
and the PCI layer makes sure the device doesn't get
disabled unintentionally.

This is software interface design 101.

The current requirements are beyond unreasonable and
should be fixed before we apply patches like this.

I'm tossing all of these patches, sorry.
