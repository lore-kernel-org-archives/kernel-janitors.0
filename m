From: Grant Grundler <grundler@parisc-linux.org>
Date: Wed, 23 Apr 2008 01:04:21 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080423010421.GD21544@colo.lackof.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 22, 2008 at 06:58:39PM +0300, Adrian Bunk wrote:
> > Why do the tulip maintainers not know about this?
> 
> tulip has a separate maintainer?

Yes :)
Kyle and I adopted tulip becuase parisc port entirely depends on them.

But it's fine. I'm not doing much with either of the xircom
drivers yet. I've only got two of those cards and have been
promised a few more (different ones).

> /me checks MAINTAINERS
> 
> Sorry, there seem to still be parts of MAINTAINERS I am not aware of.
> 
> The patch went to Jeff and netdev, and Jeff applied it (perhaps 
> wrongly assuming I was aware that there are tulip maintainers?).

Sending it to netdev+jeff is in general sufficient.
But I'm not on netdev since I just don't have the BW.
(which also partially answers willy's question).

thanks,
grant
