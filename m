From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 24 Apr 2018 05:46:20 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix a build error
Message-Id: <20180424054620.qdgij3qsvdeitmh6@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180420085938.ymf2jc46dswylxh4@mwanda>
 <20180420092105.GA28058@mwanda>
In-Reply-To: <20180420092105.GA28058@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 20 Apr 2018, Dan Carpenter wrote:

> In 2012, we changed the tps65910 API and fixed most drivers but forgot
> to update this one.
> 
> Fixes: 3f7e82759c69 ("mfd: Commonize tps65910 regmap access through header")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
