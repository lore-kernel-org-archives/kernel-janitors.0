From: Pierre Ossman <drzeus-list@drzeus.cx>
Date: Wed, 11 Oct 2006 15:07:00 +0000
Subject: Re: [KJ] most users of msleep_interruptible are broken
Message-Id: <452D0894.5080805@drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com>	 <1160571491.3000.372.camel@laptopd505.fenrus.org>	 <20061011141651.GD27388@parisc-linux.org>  <452CFD98.6010808@drzeus.cx> <1160578415.3000.381.camel@laptopd505.fenrus.org>
In-Reply-To: <1160578415.3000.381.camel@laptopd505.fenrus.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: Matthew Wilcox <matthew@wil.cx>, Amol Lad <amol@verismonetworks.com>, kernel Janitors <kernel-janitors@lists.osdl.org>, linux kernel <linux-kernel@vger.kernel.org>

Arjan van de Ven wrote:
>
> if you want that don't use the _interruptible variant. It's that simple.
>
>   

Patches welcome ;)

I believe noone has fixed the if-condition yet as well...

Rgds
Pierre

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
