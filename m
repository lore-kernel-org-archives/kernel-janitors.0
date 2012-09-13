From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 13 Sep 2012 21:35:53 +0000
Subject: Re: [pci:pci/gavin-window-alignment 5/5] arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: im
Message-Id: <1347572153.2276.26.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911224842.GA11618@localhost>
In-Reply-To: <20120911224842.GA11618@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2012-09-13 at 08:49 -0600, Bjorn Helgaas wrote:
> I merged v3.6-rc5 into my "next" branch, fixed the conflicts in
> 
>         drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
>         drivers/rapidio/devices/tsi721.c
> 
> and pushed the result.  Let me know if this is not what you expected.

Thanks. I'll end up pulling your entire next branch then. Unless you can
do the same exercise in the topic branch I'm interested in :-)

Cheers,
Ben.


