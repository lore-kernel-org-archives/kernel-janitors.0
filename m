From: Alex Chiang <achiang@hp.com>
Date: Wed, 29 Jul 2009 00:32:08 +0000
Subject: Re: [PATCH] Shut off pci_find_device warnings when the deprecated
Message-Id: <20090729003208.GB3539@ldl.fc.hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090724094115.GA18450@basil.fritz.box> <20090728095552.72c41525@jbarnes-g45> <20090729001613.GA19369@ldl.fc.hp.com> <20090729002801.GR15310@basil.fritz.box>
In-Reply-To: <20090729002801.GR15310@basil.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Jesse Barnes <jesse.barnes@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kernelnewbies@nl.linux.org

* Andi Kleen <andi@firstfloor.org>:
> > Maybe it's too late now, but I thought those warnings were
> > supposed to motivate people to convert old, buggy drivers to get
> > off the deprecated interface.
> 
> Yes they are, but this warning instance was not for a old driver,
> but for the EXPORT_SYMBOL defining the legacy function.
> 
> If any driver uses it it'll still warn.

Ok, I've been corrected. :)

I still think it would be a good learning project for someone to
audit the tree and see if they can eliminate the usages of
pci_find_device().

Thanks,

/ac

