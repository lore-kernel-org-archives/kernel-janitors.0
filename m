From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 15:56:52 +0000
Subject: Re: [PATCH 3/8] drivers/pcmcia: remove unnecessary kzalloc
Message-Id: <Pine.LNX.4.64.0911211656170.26930@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211250090.23681@ask.diku.dk> <4B07E0CB.6000508@bfs.de>
 <Pine.LNX.4.64.0911211611510.26930@ask.diku.dk> <20091121155135.GB13956@n2100.arm.linux.org.uk>
In-Reply-To: <20091121155135.GB13956@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: walter harms <wharms@bfs.de>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Just remove the first kzalloc and don't convert it to an array; that's the
> safest option.  I don't remember if there's a reason why I switched to a
> linked list - however, what I will say is that the way all the sa11xx
> and pxa stuff interact is not plainly obvious.

OK, that is what my patch does.  Thanks for looking into it.

julia
