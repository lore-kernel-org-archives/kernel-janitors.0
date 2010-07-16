From: Greg KH <gregkh@suse.de>
Date: Fri, 16 Jul 2010 04:29:43 +0000
Subject: Re: [PATCH 12/25] char: Convert pci_table entries to PCI_VDEVICE
Message-Id: <20100716042943.GB28607@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152052.38060.PeterHuewe@gmx.de> <20100715204540.GB24463@suse.de> <1279227615.5816.96.camel@Joe-Laptop.home>
In-Reply-To: <1279227615.5816.96.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Peter Huewe <PeterHuewe@gmx.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, "Digi International, Inc" <Eng.Linux@digi.com>, Alexey Dobriyan <adobriyan@gmail.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

On Thu, Jul 15, 2010 at 02:00:15PM -0700, Joe Perches wrote:
> On Thu, 2010-07-15 at 13:45 -0700, Greg KH wrote:
> > I much prefer the PCI_DEVICE() macro instead, and as such, I'm not
> > willing to take any of these patches, sorry.
> 
> grepping for pci device ids using constants and
> expecting the result to be comprehensive isn't
> sensible.

But it's a nice goal :)

> $ grep -rwP --include=*.[ch] -w PCI_VDEVICE drivers/char | wc -l
> 32

drivers/char is not exactly a large collection of PCI drivers, only some
old serial port ones.

> The current drivers/ use of PCI_VDEVICE to PCI_DEVICE is ~50/50
> 
> $ grep --include=*.[ch] -rwP PCI_DEVICE drivers | wc -l
> 866
> $ grep --include=*.[ch] -rwP PCI_VDEVICE drivers | wc -l
> 768

Hey, anything to increase that ratio is good :)

thanks,

greg k-h
