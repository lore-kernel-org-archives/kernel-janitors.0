From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 06 Apr 2020 09:03:57 +0000
Subject: Re: [PATCH] thermal: Delete an error message in four functions
Message-Id: <89b0acdd-de88-bafb-0a2c-74aaf2fe0496@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
In-Reply-To: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Allison Randal <allison@lohutok.net>, Amit Kucheria <amit.kucheria@verdurent.com>, Clark Williams <williams@redhat.com>, Colin Ian King <colin.king@canonical.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Keerthy <j-keerthy@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal Paillet <p.paillet@st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Zhang Rui <rui.zhang@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

On 05/04/2020 18:50, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 18:35:16 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit redundant messages for the exception handling in the
> calling functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
