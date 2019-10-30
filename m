From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 30 Oct 2019 18:05:59 +0000
Subject: Re: [PATCH] soc: samsung: exynos-asv: Potential NULL dereference in exynos_asv_update_opps()
Message-Id: <20191030180559.GA8016@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029182742.GC17569@mwanda>
In-Reply-To: <20191029182742.GC17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 29, 2019 at 09:27:42PM +0300, Dan Carpenter wrote:
> The dev_pm_opp_get_opp_table() returns error pointers if it's disabled
> in the config and it returns NULL if there is an error.  This code only
> checks for error pointers so it could lead to an Oops inside the
> dev_pm_opp_put_opp_table() function.
> 
> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> When we add a new driver, could we specify the which prefix will be used
> going forward?  In other words commit 5ea428595cc5 could have the
> prefix "soc: samsung: exynos-asv: Add Exynos Adaptive Supply Voltage
> driver".  The "exynos-asv" bit was missing so the first person to send a
> fix has to guess what is desired.

Indeed, I usually do not add it on first commit to avoid duplication
(prefix and later explanation) but I see that it would be helpful.


Thanks, applied.

Best regards,
Krzysztof
