From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 08:12:17 +0000
Subject: Re: [PATCH][V3] regulator: axp20x: remove a redundant null check on rdev
Message-Id: <20190218081217.GA17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215094554.28593-1-colin.king@canonical.com>
In-Reply-To: <20190215094554.28593-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 15, 2019 at 09:45:54AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently rdev is dereferenced when assigning desc before rdev is null
> checked, this is leading to static analysis warnings.  However, rdev
> can never be null, so the null check is redundant and can be removed.
> 
> Detected by CoverityScan, CID#1476031 ("Dereference before null check")
> 
> Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> --

We need a third '-' character on the cut off marker.

> 
> V2: Fix 2nd occurrance of this thinko
> V3: Remove null check, Dan Carpenter noted that rdev can never be null.
> ---

regards,
dan carpenter
