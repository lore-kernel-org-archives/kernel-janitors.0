From: Andrzej Hajda <a.hajda@samsung.com>
Date: Wed, 25 Sep 2019 08:09:36 +0000
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: Use devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
Message-Id: <475b8bc5-b7da-bf20-c322-e15e74d19378@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
        <CGME20190923090614epcas5p215731e8359c634f7ed76759f68622e4f@epcas5p2.samsung.com>
        <59343c81-3dd8-023c-6440-d48c8d74e05e@st.com>
In-Reply-To: <59343c81-3dd8-023c-6440-d48c8d74e05e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yannick FERTRE <yannick.fertre@st.com>, Markus Elfring <Markus.Elfring@web.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Matt Redfearn <matt.redfearn@thinci.com>, Neil Armstrong <narmstrong@baylibre.com>, Nickey Yang <nickey.yang@rock-chips.com>, Philippe CORNU <philippe.cornu@st.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Yannick, Markus.

On 23.09.2019 11:05, Yannick FERTRE wrote:
> Reviewed-by: Yannick Fertré <yannick.fertre@st.com> 
> Tested-by: Yannick Fertré <yannick.fertre@st.com> 


Yannick, next time could you put your tags after tags of the patch,
otherwise patchwork is confused and creates incorrect patches [1].

[1]: https://patchwork.freedesktop.org/patch/332360/


> Best regards
>
> -- 
> Yannick Fertré | TINA: 166 7152 | Tel: +33 244027152 | Mobile: +33
> 620600270
> Microcontrollers and Digital ICs Group | Microcontrolleurs Division
>
>
> On 9/21/19 8:20 PM, Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Sat, 21 Sep 2019 20:04:08 +0200
>>
>> Simplify this function implementation by using a known wrapper function.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>


I meant here :)


Anyway, patch queued.


Regards

Andrzej



>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> index 675442bfc1bd..6ada149af9ef 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> @@ -981,7 +981,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>>  	struct device *dev = &pdev->dev;
>>  	struct reset_control *apb_rst;
>>  	struct dw_mipi_dsi *dsi;
>> -	struct resource *res;
>>  	int ret;
>>
>>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>> @@ -997,11 +996,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>>  	}
>>
>>  	if (!plat_data->base) {
>> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -		if (!res)
>> -			return ERR_PTR(-ENODEV);
>> -
>> -		dsi->base = devm_ioremap_resource(dev, res);
>> +		dsi->base = devm_platform_ioremap_resource(pdev, 0);
>>  		if (IS_ERR(dsi->base))
>>  			return ERR_PTR(-ENODEV);
>>
>> --
>> 2.23.0
>>
>
