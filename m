From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Mon, 01 Dec 2008 20:30:49 +0000
Subject: Re: [PATCH 2/2] drivers/pci/hotplug: Add missing pci_dev_get
Message-Id: <200812011230.49406.jbarnes@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811230907370.28343@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811230907370.28343@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday, November 23, 2008 12:08 am Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
> error case.
>
> An alterative would be to move the test_and_set_bit before the call to
> pci_get_slot.
>
> The problem was fixed using the following semantic patch.
> (http://www.emn.fr/x-info/coccinelle/)

Applied to my linux-next branch, thanks.  Btw, I've seen quite a few of these 
Coccinelle related patches fly by, but I haven't seen an introduction of the 
tool posted to lkml.  Did I miss it?  Or maybe it just went to the janitors 
list?  If not, it seems like it might be a worthwhile thing to describe for 
people...


-- 
Jesse Barnes, Intel Open Source Technology Center

