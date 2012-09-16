From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 16 Sep 2012 23:23:50 +0000
Subject: Re: [PATCH 2/3] drivers/mfd/palmas.c: drop kfree of devm_kzalloc's data
Message-Id: <20120916232350.GN3647@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344081632-4729-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344081632-4729-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Sat, Aug 04, 2012 at 02:00:31PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Using kfree to free data allocated with devm_kzalloc causes double frees.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x;
> @@
> 
> x = devm_kzalloc(...)
> ...
> ?-kfree(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/mfd/palmas.c |    1 -
>  1 file changed, 1 deletion(-)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
