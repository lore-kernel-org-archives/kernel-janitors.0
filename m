From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Thu, 01 Dec 2011 08:02:56 +0000
Subject: Re: [patch v2] mtd/docg3: dereferencing an ERR_PTR() in
Message-Id: <1322726578.2332.7.camel@koala>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <87r50vi20u.fsf@free.fr>
 <20111128134947.GK21128@mwanda>
In-Reply-To: <20111128134947.GK21128@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>

On Mon, 2011-11-28 at 16:53 +0300, Dan Carpenter wrote:
> If doc_probe_device() returned an ERR_PTR, then we accidentally saved
> that to docg3_floors[floor] = mtd; which gets derefenced in the error
> handling when we call doc_release_device().
> 
> I've reworked the error handling to take care of that and hopefully
> make it a little simpler.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd-2.6.git, thanks!

Artem.

