From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Mon, 21 Dec 2015 09:33:16 +0000
Subject: Re: [PATCH 3/4] s390/cio: add NULL test
Message-Id: <20151221093316.GA4058@osiris>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
 <1450610153-7746-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450610153-7746-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, kernel-janitors@vger.kernel.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Dec 20, 2015 at 12:15:52PM +0100, Julia Lawall wrote:
> Add NULL test on call to kzalloc.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x;
> identifier fld;
> @@
> 
> * x = kzalloc(...);
>   ... when != x = NULL
>   x->fld
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Aplied, thanks.

