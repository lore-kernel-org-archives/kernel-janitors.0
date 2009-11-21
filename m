From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Sat, 21 Nov 2009 15:16:47 +0000
Subject: Re: [PATCH 3/8] drivers/pcmcia: remove unnecessary kzalloc
Message-Id: <20091121151647.GA13956@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211250090.23681@ask.diku.dk> <4B07E0CB.6000508@bfs.de> <Pine.LNX.4.64.0911211611510.26930@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911211611510.26930@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: walter harms <wharms@bfs.de>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 21, 2009 at 04:12:59PM +0100, Julia Lawall wrote:
> Both kzallocs were added at the same time, when the function was added in 
> commit 701a5dc05ad99a06958b3f97cb69d99b47cebee3.  I have added the author 
> to the CC list.

That commit id means nothing to me.
