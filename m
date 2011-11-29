From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 29 Nov 2011 22:00:09 +0000
Subject: Re: [patch v2] mtd/docg3: dereferencing an ERR_PTR() in docg3_probe()
Message-Id: <874nxm8u8m.fsf@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <87r50vi20u.fsf@free.fr>
 <20111128134947.GK21128@mwanda>
In-Reply-To: <20111128134947.GK21128@mwanda> (Dan Carpenter's message of "Mon,
 28 Nov 2011 16:53:13 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> If doc_probe_device() returned an ERR_PTR, then we accidentally saved
> that to docg3_floors[floor] = mtd; which gets derefenced in the error
> handling when we call doc_release_device().
>
> I've reworked the error handling to take care of that and hopefully
> make it a little simpler.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Version 1 conflicted with another patch in stream.
Ok, applied and tested locally (even if that branch of code obviously is not
triggered in my case), and everything should work even better with it.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
