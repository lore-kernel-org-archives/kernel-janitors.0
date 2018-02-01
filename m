From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Feb 2018 11:16:10 +0000
Subject: Re: [PATCH] coccinelle: reduce false positives
Message-Id: <20180201111610.24r75fssivaykff3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
 <20180201102501.kc5pfxojn7fhxat4@mwanda>
 <alpine.DEB.2.20.1802011158110.3135@hadrien>
In-Reply-To: <alpine.DEB.2.20.1802011158110.3135@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Thu, Feb 01, 2018 at 12:06:35PM +0100, Julia Lawall wrote:
> Here are the results that are eliminated by my change:
> 
> drivers/clk/axs10x/pll_clock.c:323:1-6 kfree(pll_clk);
> drivers/clk/clk-gpio.c:131:2-7 kfree(clk_gpio);
> drivers/clk/clk-hsdk-pll.c:410:1-6 kfree(pll_clk);
> drivers/clk/hisilicon/clk.c:97:1-6 kfree(clk_data);
> drivers/mfd/syscon.c:130:1-8 iounmap(base);
> drivers/mfd/syscon.c:132:1-6 kfree(syscon);
> drivers/pinctrl/freescale/pinctrl-mxs.c:139:2-7 kfree(group);
> drivers/pinctrl/samsung/pinctrl-exynos5440.c:264:1-6 kfree(gname);
> drivers/platform/chrome/cros_ec_debugfs.c:248:1-6 kfree(msg);
> drivers/pwm/pwm-lp3943.c:56:3-8 kfree(pwm_map);
> 
> The semantic patch is pretty naive in that it assumes that all uses of the
> same name point to the same thing.
> 

Huh...  It leads to false positives but it is an easier way to do cross
function analysis.  I had wondered about that.

regards,
dan carpenter

