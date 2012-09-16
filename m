From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 16 Sep 2012 23:24:48 +0000
Subject: Re: [PATCH 2/6] drivers/mfd: drop frees of devm allocated data
Message-Id: <20120916232448.GO3647@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344099049-15212-2-git-send-email-Julia.Lawall@lip6.fr>
 <20120806140515.GM4352@mwanda>
 <alpine.DEB.2.02.1208132135380.2355@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1208132135380.2355@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Mon, Aug 13, 2012 at 09:36:06PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm_kfree should not have to be explicitly used.
> devm_regmap_init_i2c also does not require an explicit free.
> 
> The semantic patch that fixes the first problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,d;
> @@
> 
> x = devm_kzalloc(...)
> ...
> ?-devm_kfree(d,x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> v2: Removed over-eager optimization of some error-handling code.
> 
>  drivers/mfd/88pm800.c |    5 +----
>  drivers/mfd/88pm80x.c |   19 +++----------------
>  2 files changed, 4 insertions(+), 20 deletions(-)
This one does not apply to my for-next branch, would you please mind rebasing
it against that branch ?

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
