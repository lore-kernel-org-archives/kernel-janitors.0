From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 08:59:39 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180420085938.ymf2jc46dswylxh4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419134634.GA19793@mwanda>
In-Reply-To: <20180419134634.GA19793@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 19, 2018 at 04:46:34PM +0300, Dan Carpenter wrote:
> The tps_comparators[] array is used in two places.  We only access the
> COMP1 (1) and COMP2 (2) elements.  Unfortunately, we're accessing the
> wrong elements and also one element beyond the end of the array.  There
> was supposed to be a zero element at the start of the array which is
> isn't accessed but makes the math work out nicely.
> 
> Fixes: 6851ad3ab346 ("TPS65911: Comparator: Add comparator driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I can't actually compile this code...

I assumed that I couldn't compile this code because it was non-x86 or
something but actually it's just really out of date.  We broke it in
2012 when we removed the ->write() function pointer.

commit 3f7e82759c692df473675ed06fb90b20f1f225c3
Author: Rhyland Klein <rklein@nvidia.com>
Date:   Tue May 8 11:42:38 2012 -0700

    mfd: Commonize tps65910 regmap access through header

regards,
dan carpenter


