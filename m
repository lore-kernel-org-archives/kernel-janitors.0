From: Rhyland Klein <rklein@nvidia.com>
Date: Mon, 23 Apr 2018 18:13:15 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix a build error
Message-Id: <df8e9468-4099-5248-3f5a-59550aa830a9@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180420092105.GA28058@mwanda>
In-Reply-To: <20180420092105.GA28058@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/20/2018 5:21 AM, Dan Carpenter wrote:
> In 2012, we changed the tps65910 API and fixed most drivers but forgot
> to update this one.
> 
> Fixes: 3f7e82759c69 ("mfd: Commonize tps65910 regmap access through header")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

LGTM

Acked-by: Rhyland Klein <rklein@nvidia.com>


-- 
nvpublic
