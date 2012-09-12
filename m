From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Wed, 12 Sep 2012 23:27:59 +0000
Subject: Re: [pci:pci/gavin-window-alignment 5/5] arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: im
Message-Id: <1347492479.2276.16.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911224842.GA11618@localhost>
In-Reply-To: <20120911224842.GA11618@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-09-11 at 17:09 -0600, Bjorn Helgaas wrote:
> Sorry, this is my fault.  I fixed this earlier, but I did it the wrong
> way.
> 
> What I did before was just update the patch in the
> pci/gavin-window-alignment branch.  But what I should have done was to
> rebase that branch on top of pci/jiang-pcie-cap, which the branch it
> actually depends on (that's where pci_pcie_type() was added).
> 
> So I did that rebase and pushed both pci/gavin-window-alignment and
> next again.  I think the result is sensible now.

The result has content conflicts against a couple of drivers. If I fix
that up locally that means that things might end up being a bit more
complicated than expected when reconciling everything with Linus and
that worries me.

Any chance you can pull in a recent Linus tree & fixup the merges before
I pull that in myself ?

Cheers,
Ben.


