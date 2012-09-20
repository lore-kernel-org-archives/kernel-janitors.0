From: Samuel Ortiz <sameo@linux.intel.com>
Date: Thu, 20 Sep 2012 14:21:19 +0000
Subject: Re: [mfd:for-next 47/76] drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not decla
Message-Id: <20120920142119.GR28670@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919233348.GD5607@localhost>
In-Reply-To: <20120919233348.GD5607@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Thu, Sep 20, 2012 at 07:33:48AM +0800, Fengguang Wu wrote:
> Hi Stephen,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
> head:   144c94c99ad2f20ff37ca77147a10da7718895ad
> commit: 9582fdcb6fcf1b596a83b161a2ea886272d2a62f [47/76] mfd: max8907: Add power off control
> 
> All sparse warnings:
> 
> + drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not declared. Should it be static?
> 
> vim +179 drivers/mfd/max8907.c
>    169	
>    170	static const struct regmap_irq_chip max8907_rtc_irq_chip = {
>    171		.name = "max8907 rtc",
>    172		.status_base = MAX8907_REG_RTC_IRQ,
>    173		.mask_base = MAX8907_REG_RTC_IRQ_MASK,
>    174		.num_regs = 1,
>    175		.irqs = max8907_rtc_irqs,
>    176		.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
>    177	};
>    178	
>  > 179	struct max8907 *max8907_pm_off;
>    180	static void max8907_power_off(void)
>    181	{
>    182		regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
>    183				MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
>    184	}
>    185	
>    186	static __devinit int max8907_i2c_probe(struct i2c_client *i2c,
>    187					       const struct i2c_device_id *id)
>    188	{
>    189		struct max8907 *max8907;
> 
> Please consider folding the attached diff :-)
I applied this one on top of my for-next branch. I took the freedom to add
your SOB on it, please let me know if that's an issue for you.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
