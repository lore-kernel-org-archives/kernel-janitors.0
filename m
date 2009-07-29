From: Alex Chiang <achiang@hp.com>
Date: Wed, 29 Jul 2009 00:16:13 +0000
Subject: Re: [PATCH] Shut off pci_find_device warnings when the deprecated
Message-Id: <20090729001613.GA19369@ldl.fc.hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090724094115.GA18450@basil.fritz.box> <20090728095552.72c41525@jbarnes-g45>
In-Reply-To: <20090728095552.72c41525@jbarnes-g45>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jesse.barnes@intel.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kernelnewbies@nl.linux.org

* Jesse Barnes <jesse.barnes@intel.com>:
> On Fri, 24 Jul 2009 11:41:15 +0200
> Andi Kleen <andi@firstfloor.org> wrote:
> 
> > Shut off pci_find_device warnings when the deprecated pci functions
> > are enabled.
> > 
> > Shut off the long standing
> > 
> > linux/drivers/pci/search.c:144: warning: 'pci_find_device' is
> > deprecated (declared at linux/drivers/pci/search.c:136)
> > linux/drivers/pci/search.c:144: warning: 'pci_find_device' is
> > deprecated (declared at linux/drivers/pci/search.c:136)
> > 
> > warnings that appear on every build when CONFIG_PCI_LEGACY is enabled.
> > 
> > gcc warns for the use in EXPORT_SYMBOL
> > 
> > I moved these to a separate file and disabled the warning in the
> > Makefile for that file.
> > 
> > Signed-off-by: Andi Kleen <ak@linux.intel.com>
> 
> Applied to linux-next, thanks.

Maybe it's too late now, but I thought those warnings were
supposed to motivate people to convert old, buggy drivers to get
off the deprecated interface.

That's what finally motivated me to get rid of pci_find_slot()
earlier...

By the way, this would also be a perfect kernelnewbies/kernel
janitor cleanup, as it would require actually digging into
drivers and making real, substantial changes as opposed to
whitespace/checkpatch/typo patches.

Just a thought.

/ac

