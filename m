From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 May 2017 04:54:12 +0000
Subject: Re: [PATCH] net: dsa: loop: Check for memory allocation failure
Message-Id: <9bcaa225-2feb-a5c6-fe5c-c5a2a6dccf68@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170506052945.2639-1-christophe.jaillet@wanadoo.fr>
 <063D6719AE5E284EB5DD2968C1650D6DCFFE715E@AcuExch.aculab.com>
 <alpine.DEB.2.20.1705082031280.3440@hadrien>
 <1494265443.31950.62.camel@perches.com>
 <alpine.DEB.2.20.1705090745190.3309@hadrien>
 <f9058de7-ef9e-f6eb-751d-72ffdce512bb@gmail.com>
 <1494343107.20782.2.camel@perches.com>
 <57023eee-a975-5984-dcc5-adee61235c47@wanadoo.fr>
 <alpine.DEB.2.20.1705101245370.3326@hadrien>
In-Reply-To: <alpine.DEB.2.20.1705101245370.3326@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



Le 10/05/2017 =E0 06:46, Julia Lawall a =E9crit :
>
> On Wed, 10 May 2017, Christophe JAILLET wrote:
>
>> Le 09/05/2017 =E0 17:18, Joe Perches a =E9crit :
>>> On Mon, 2017-05-08 at 17:35 -0700, Florian Fainelli wrote:
>>>> On 05/08/2017 04:46 PM, Julia Lawall wrote:
>>>>> On Mon, 8 May 2017, Joe Perches wrote:
>>>>>> Each time -EPROBE_DEFER occurs, another set of calls to
>>>>>> dsa_switch_alloc and dev_kzalloc also occurs.
>>>>>>
>>>>>> Perhaps it'd be better to do:
>>>>>>
>>>>>> 	if (ps->netdev) {
>>>>>> 		devm_kfree(&devmdev->dev, ps);
>>>>>> 		devm_kfree(&mdiodev->dev, ds);
>>>>>> 		return -EPROBE_DEFER;
>>>>>> 	}
>>>>> Is EPROBE_DEFER handled differently than other kinds of errors?
>>>> In the core device driver model, yes, EPROBE_DEFER is treated
>>>> differently than other errors because it puts the driver on a retry qu=
eue.
>>>>
>>>> EPROBE_DEFER is already a slow and exceptional path, and this is a
>>>> mock-up driver, so I am not sure what value there is in trying to
>>>> balance devm_kzalloc() with corresponding devm_kfree()...
>>> Example code should be as correct as possible.
>>>
>> Le 09/05/2017 =E0 17:18, Joe Perches a =E9crit :
>>> On Mon, 2017-05-08 at 17:35 -0700, Florian Fainelli wrote:
>>>> On 05/08/2017 04:46 PM, Julia Lawall wrote:
>>>>> On Mon, 8 May 2017, Joe Perches wrote:
>>>>>> Each time -EPROBE_DEFER occurs, another set of calls to
>>>>>> dsa_switch_alloc and dev_kzalloc also occurs.
>>>>>>
>>>>>> Perhaps it'd be better to do:
>>>>>>
>>>>>> 	if (ps->netdev) {
>>>>>> 		devm_kfree(&devmdev->dev, ps);
>>>>>> 		devm_kfree(&mdiodev->dev, ds);
>>>>>> 		return -EPROBE_DEFER;
>>>>>> 	}
>>>>> Is EPROBE_DEFER handled differently than other kinds of errors?
>>>> In the core device driver model, yes, EPROBE_DEFER is treated
>>>> differently than other errors because it puts the driver on a retry qu=
eue.
>>>>
>>>> EPROBE_DEFER is already a slow and exceptional path, and this is a
>>>> mock-up driver, so I am not sure what value there is in trying to
>>>> balance devm_kzalloc() with corresponding devm_kfree()...
>>> Example code should be as correct as possible.
>>>
>> (* number of people/mailing list in copy has been reduced *)
>>
>>
>> The coccinelle script below gives the following list of candidates for s=
uch
>> improvement.
>>
>> char/hw_random/omap-rng.c
>> clk/clk-si5351.c
>> clk/clk-versaclock5.c
>> crypto/mediatek/mtk-platform.c
>> devfreq/rk3399_dmc.c
>> dma/mv_xor_v2.c
>> dma/omap-dma.c
>> gpu/drm/arc/arcpgu_hdmi.c
>> gpu/drm/bridge/dumb-vga-dac.c
>> gpu/drm/bridge/lvds-encoder.c
>> gpu/drm/exynos/exynos_dp.c
>> gpu/drm/exynos/exynos_drm_dsi.c
>> gpu/drm/imx/dw_hdmi-imx.c
>> gpu/drm/mediatek/mtk_dpi.c
>> gpu/drm/mediatek/mtk_drm_ddp_comp.c
>> gpu/drm/mediatek/mtk_dsi.c
>> gpu/drm/panel/panel-lvds.c
>> gpu/drm/panel/panel-simple.c
>> gpu/drm/panel/panel-sitronix-st7789v.c
>> gpu/drm/rcar-du/rcar_du_lvdscon.c
>> gpu/drm/rockchip/cdn-dp-core.c
>> gpu/drm/rockchip/dw_hdmi-rockchip.c
>> gpu/drm/sti/sti_hdmi.c
>> gpu/drm/tegra/sor.c
>> gpu/drm/tilcdc/tilcdc_panel.c
>> gpu/drm/vc4/vc4_hdmi.c
>> gpu/ipu-v3/ipu-common.c
>> gpu/ipu-v3/ipu-pre.c
>> gpu/ipu-v3/ipu-prg.c
>> hwtracing/coresight/coresight-stm.c
>> i2c/busses/i2c-designware-platdrv.c
>> i2c/busses/i2c-mv64xxx.c
>> i2c/muxes/i2c-mux-gpio.c
>> i2c/muxes/i2c-mux-pinctrl.c
>> i2c/muxes/i2c-mux-reg.c
>> iommu/mtk_iommu.c
>> iommu/mtk_iommu_v1.c
>> irqchip/qcom-irq-combiner.c
>> mailbox/mailbox-test.c
>> media/i2c/mt9m111.c
>> media/i2c/ov2640.c
>> media/i2c/ov7670.c
>> media/i2c/smiapp/smiapp-core.c
>> media/i2c/soc_camera/imx074.c
>> media/platform/coda/coda-common.c
>> media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
>> media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
>> media/platform/s5p-cec/s5p_cec.c
>> media/platform/sti/cec/stih-cec.c
>> memory/tegra/tegra124-emc.c
>> mfd/twl6040.c
>> mtd/nand/lpc32xx_mlc.c
>> mtd/nand/lpc32xx_slc.c
>> net/dsa/dsa_loop.c
>> net/ethernet/mediatek/mtk_eth_soc.c
>> net/phy/xilinx_gmii2rgmii.c
>> net/wireless/ti/wlcore/spi.c
>> pci/host/pcie-iproc-platform.c
>> phy/phy-exynos5250-sata.c
>> phy/phy-mt65xx-usb3.c
>> phy/phy-qcom-qusb2.c
>> phy/phy-sun4i-usb.c
>> pinctrl/core.c
>> pinctrl/pinctrl-at91.c
>> platform/x86/intel_cht_int33fe.c
>> power/supply/act8945a_charger.c
>> power/supply/axp20x_ac_power.c
>> power/supply/axp20x_battery.c
>> power/supply/axp288_charger.c
>> power/supply/bq24190_charger.c
>> power/supply/cpcap-charger.c
>> power/supply/gpio-charger.c
>> soc/bcm/raspberrypi-power.c
>> thermal/samsung/exynos_tmu.c
>> tty/serial/8250/8250_dw.c
>> tty/serial/max310x.c
>> tty/serial/sccnxp.c
>> usb/chipidea/ci_hdrc_msm.c
>> usb/gadget/udc/mv_udc_core.c
>> usb/host/xhci-mtk.c
>> usb/mtu3/mtu3_plat.c
>> usb/musb/sunxi.c
>> usb/phy/phy-am335x.c
>> usb/phy/phy-generic.c
>> usb/phy/phy-twl6030-usb.c
>> video/backlight/hx8357.c
>> video/backlight/lp855x_bl.c
>> video/fbdev/simplefb.c
>>
>>
>> Coccinelle script :
>> =3D=3D=3D=3D=3D=3D=3D=3D>> // find calls to kmalloc or equivalent functi=
on
>> @call@
>> expression ptr;
>> position p;
>> @@
>>
>> (
>> *   ptr@p =3D kmalloc(...)
>> |
>> *   ptr@p =3D kzalloc(...)
>> |
>> *   ptr@p =3D kcalloc(...)
>> |
>> *   ptr@p =3D kmalloc_array(...)
> Do you get any reports for the above function?  Those would normally just
> be memory leaks.
Only one, but the corresponding kfree was in place.

> julia
>
>> |
>> *   ptr@p =3D devm_kmalloc(...)
>> |
>> *   ptr@p =3D devm_kzalloc(...)
>> |
>> *   ptr@p =3D devm_kcalloc(...)
>> |
>> *   ptr@p =3D devm_kmalloc_array(...)
>> )
>>   ...
>> *  return -EPROBE_DEFER;
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
