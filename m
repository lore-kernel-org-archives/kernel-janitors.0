From: Joerg Roedel <joro@8bytes.org>
Date: Fri, 28 May 2010 07:09:21 +0000
Subject: Re: [PATCH 0/4] Add a Coccinelle front-end script
Message-Id: <20100528070921.GK1237@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1273508667-5152-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Mon, May 10, 2010 at 06:24:23PM +0200, Nicolas Palix wrote:
> Three semantic patches, with a low rate of false positives, are also
> included.

Is there a way to annotate false positives so that they do not produce
warnings over and over?

> Other semantic patches will be provided later. Note that a semantic
> patch does not need to define all four modes. As many semantic patches
> may be proposed later, they are organized under sub-directories of
> 'scripts/coccinelle/'.

Don't know how complex the coccinelle software itself is, but I think it
would make sense to ship it with the kernel-sources too. That together
with a README and everything is perfect :-)
Thanks for the great work, this should definitly be upstream.

	Joerg

