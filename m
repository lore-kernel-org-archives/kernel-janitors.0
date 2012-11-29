From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 29 Nov 2012 18:46:54 +0000
Subject: Re: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
Message-Id: <87zk201c2p.fsf@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129141651.GA12199@elgon.mountain>
In-Reply-To: <20121129141651.GA12199@elgon.mountain> (Dan Carpenter's message
 of "Thu, 29 Nov 2012 17:16:51 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>, David Woodhouse <dwmw2@infradead.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> If we set oobdelta to zero then we will either return -EINVAL or hit
> a divide (modulus) by zero on the next line when we check
> "(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  I don't know if it's actually possible to hit this
> condition.
I don't know any possibility to reach that condition, nonetheless the patch
makes the code more robust, therefore :

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
