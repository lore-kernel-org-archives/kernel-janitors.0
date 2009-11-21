From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Sat, 21 Nov 2009 16:06:54 +0000
Subject: Re: [PATCH 3/8] drivers/pcmcia: remove unnecessary kzalloc
Message-Id: <20091121160654.GA11292@isilmar.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211250090.23681@ask.diku.dk> <4B07E0CB.6000508@bfs.de> <Pine.LNX.4.64.0911211611510.26930@ask.diku.dk> <20091121155135.GB13956@n2100.arm.linux.org.uk>
In-Reply-To: <20091121155135.GB13956@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Julia Lawall <julia@diku.dk>, linux-pcmcia@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, walter harms <wharms@bfs.de>

Russell,

> Thanks for the additional info which allows me to track which patch it
> corresponds with.  As an aside, it's really not nice to git pull and
> then edit the commits afterwards - that's much worse than rebasing.
> When trees are pulled, the act of merging it conveys sufficent "sign-off".

It was not a git pull and edit, as I told you in a mail sent on Nov 02:

> Thanks! I've applied the patches you sent me by mail, though, as your tree
> was based on something more recent from Linus than my tree, and I wanted to
> avoid a merge of Linus' tree into my tree.

Best,
	Dominik
