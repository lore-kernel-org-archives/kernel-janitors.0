From: Julia Lawall <julia@diku.dk>
Date: Mon, 09 Jun 2008 13:22:53 +0000
Subject: Re: [PATCH 2/4] drivers/macintosh/smu.c: add missing of_node_put
Message-Id: <Pine.LNX.4.64.0806091521390.16009@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806091420080.16009@ask.diku.dk>
	<20080609230752.f3bba16d.sfr@canb.auug.org.au>
In-Reply-To: <20080609230752.f3bba16d.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

> However, the error handling in that routine (smu_init) needs much more
> work.

Indeed, the smu = NULL at the end of the function seems a bit brutal - a 
lot of allocated data ends up not getting freed.  I can try to do 
something about it.  Did you see something else?

julia

