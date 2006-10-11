From: Pierre Ossman <drzeus-list@drzeus.cx>
Date: Wed, 11 Oct 2006 14:20:08 +0000
Subject: Re: [KJ] most users of msleep_interruptible are broken
Message-Id: <452CFD98.6010808@drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com> <1160571491.3000.372.camel@laptopd505.fenrus.org> <20061011141651.GD27388@parisc-linux.org>
In-Reply-To: <20061011141651.GD27388@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Arjan van de Ven <arjan@infradead.org>, Amol Lad <amol@verismonetworks.com>, kernel Janitors <kernel-janitors@lists.osdl.org>, linux kernel <linux-kernel@vger.kernel.org>

Matthew Wilcox wrote:
> 
> They clearly don't care about exactness; they msleep_interruptible and
> throw away the return value, so they don't know how long they slept
> before they got a signal.
> 

It's broken then. That delay function should delay at least the amount
given.

Rgds
Pierre

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
