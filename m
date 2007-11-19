From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Mon, 19 Nov 2007 08:22:39 +0000
Subject: Re: [PATCH 2/5] drivers/macintosh/via-pmu.c: Add missing
Message-Id: <1195460559.7022.38.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711190903100.19198@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711190903100.19198@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Mon, 2007-11-19 at 09:03 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> There should be a pci_dev_put when breaking out of a loop that iterates
> over calls to pci_get_device and similar functions.
> 
> In this case, the return under the #else case of #ifdef HACKED_PCI_SAVE
> should have a pci_dev_put, just as the return in the case where
> HACKED_PCI_SAVE is true does.
> 
> This was fixed using the following semantic patch.

I think most of that code is no longer necessary (and the lack of
pci_dev_put() is mostly due to the fact that this code long predates the
existence of pci_dev_put :-)

I want to try out without that PCI save/restore code on a couple of old
machines see if we can just remove the whole thing.

Ben.


