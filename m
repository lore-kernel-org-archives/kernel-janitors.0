From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Mon, 23 Nov 2009 10:55:58 +0000
Subject: Re: [PATCH] drivers/regulator: use PTR_ERR to get error code
Message-Id: <1258973758.3629.64.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911212218210.28848@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911212218210.28848@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2009-11-21 at 22:18 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> IS_ERR returns only 1 or 0.  The callsite of setup_regulators expects a
> negative integer in an error case.  Thus, PTR_ERR has to be used to extract
> it.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E,E1;
> @@
> 
> *E = IS_ERR(...)
>  ... when != E = E1
> *return E;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 

Applied.

Thanks

Liam

