From: Joe Perches <joe@perches.com>
Date: Thu, 15 Jul 2010 21:00:15 +0000
Subject: Re: [PATCH 12/25] char: Convert pci_table entries to PCI_VDEVICE
Message-Id: <1279227615.5816.96.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152052.38060.PeterHuewe@gmx.de>
	 <20100715204540.GB24463@suse.de>
In-Reply-To: <20100715204540.GB24463@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: Peter Huewe <PeterHuewe@gmx.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, "Digi International, Inc" <Eng.Linux@digi.com>, Alexey Dobriyan <adobriyan@gmail.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

On Thu, 2010-07-15 at 13:45 -0700, Greg KH wrote:
> I much prefer the PCI_DEVICE() macro instead, and as such, I'm not
> willing to take any of these patches, sorry.

grepping for pci device ids using constants and
expecting the result to be comprehensive isn't
sensible.
 
$ grep -rwP --include=*.[ch] -w PCI_VDEVICE drivers/char | wc -l
32

The current drivers/ use of PCI_VDEVICE to PCI_DEVICE is ~50/50

$ grep --include=*.[ch] -rwP PCI_DEVICE drivers | wc -l
866
$ grep --include=*.[ch] -rwP PCI_VDEVICE drivers | wc -l
768


