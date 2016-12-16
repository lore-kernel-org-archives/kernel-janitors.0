From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 10:34:44 +0000
Subject: Re: [patch 1/3] spi: armada-3700: Signedness bug in probe
Message-Id: <20161216103444.GC8244@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216082443.GA7031@elgon.mountain>
 <e1c6a534-6b6c-a83f-390f-b65654ff2bcf@free-electrons.com>
 <20161216095655.GB8244@mwanda>
 <9e5f6a38-6177-4026-7930-150c6b281a99@free-electrons.com>
In-Reply-To: <9e5f6a38-6177-4026-7930-150c6b281a99-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We really should make it int consistently through out.  But it doesn't
matter because request_irq() rarely fails and static checkers are good
at catching the bugs...

regards,
dan carpenter

