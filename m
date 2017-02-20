From: Stephen Boyd <stephen.boyd@linaro.org>
Date: Mon, 20 Feb 2017 08:17:03 +0000
Subject: Re: [PATCH] phy: qcom-usb-hsic: Fix error handling
Message-Id: <148757862379.30630.3244433580235647479@sboyd-linaro>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219130229.11730-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219130229.11730-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon@ti.com, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Quoting Christophe JAILLET (2017-02-19 05:02:29)
> According to error handling in this function, it is likely that going to
> 'err_ulpi' was expected here.
> 
> Fixes:  605b8652f7f0 ("phy: Add support for Qualcomm's USB HSIC phy")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yes. Thanks.

Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
