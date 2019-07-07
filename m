From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Sun, 07 Jul 2019 21:16:38 +0000
Subject: Re: [PATCH] rtc: stm32: One function call less in stm32_rtc_set_alarm()
Message-Id: <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
In-Reply-To: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

On Fri, Jul 05, 2019 at 10:17:11PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 22:10:10 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.

... and a totally pointless use of the ternary operator.

> @@ -519,11 +519,7 @@ static int stm32_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	/* Write to Alarm register */
>  	writel_relaxed(alrmar, rtc->base + regs->alrmar);
> 
> -	if (alrm->enabled)
> -		stm32_rtc_alarm_irq_enable(dev, 1);
> -	else
> -		stm32_rtc_alarm_irq_enable(dev, 0);
> -
> +	stm32_rtc_alarm_irq_enable(dev, alrm->enabled ? 1 : 0);

If we look at stm32_rtc_alarm_irq_enable():

static int stm32_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
{
...
	if (enabled)
		do A;
	else
		do B;
...
}

alrm->enabled is an unsigned char.  So, the above can be simplified to:

	stm32_rtc_alarm_irq_enable(dev, alrm->enabled);

without any need what so ever to use the ternary operator.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
