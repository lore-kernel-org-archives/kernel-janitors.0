From: Michal Marek <mmarek@suse.cz>
Date: Fri, 11 Jun 2010 22:02:58 +0000
Subject: Re: [PATCH 0/7] Add some checks to be used with Coccinelle
Message-Id: <4C12B292.7020809@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275837307-4283-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1275837307-4283-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, =?ISO-8859-2?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Andy Isaacson <adi@hexapodia.org>, Linus Torvalds <torvalds@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, walter harms <wharms@bfs.de>, Joerg Roedel <joro@8bytes.org>, Jan Engelhardt <jengelh@medozas.de>

On 6.6.2010 17:15, Nicolas Palix wrote:
> This patch series adds a front-end to use Coccinelle.  It also
> includes a documentation file describing how to use the new
> 'coccicheck' target. Finally, some SmPL examples are provided.
> 
> Signed-off-by: Nicolas Palix <npalix@diku.dk>
> Signed-off-by: Julia Lawall <julia@diku.dk>

I see all the points raised are addressed now, so I applied this.

Michal
