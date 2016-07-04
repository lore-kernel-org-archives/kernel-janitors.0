From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Mon, 04 Jul 2016 07:53:42 +0000
Subject: Re: [PATCH] phy: fix error handling
Message-Id: <577A15D2.5010103@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467525332-12963-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <00d5243a-0359-1dc7-e9aa-1ad8a9074821@wanadoo.fr>
In-Reply-To: <00d5243a-0359-1dc7-e9aa-1ad8a9074821@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hi,

On Monday 04 July 2016 02:38 AM, Christophe JAILLET wrote:
> I will resubmit in the coming days.
>=20
>    return PTR_ERR(phy->clk);
> should also be updated.

while at that, also fix your $subject to something like
"phy: sun9i-usb: fix error handling"

Thanks
Kishon

>=20
> Best regards,
> CJ
>=20
> Le 03/07/2016 =E0 07:55, Christophe JAILLET a =E9crit :
>> This is likely that checking 'phy->hsic_clk' instead of 'phy->clk' is
>> expected here.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/phy/phy-sun9i-usb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-sun9i-usb.c b/drivers/phy/phy-sun9i-usb.c
>> index ac4f31a..ff99eba 100644
>> --- a/drivers/phy/phy-sun9i-usb.c
>> +++ b/drivers/phy/phy-sun9i-usb.c
>> @@ -141,7 +141,7 @@ static int sun9i_usb_phy_probe(struct platform_devic=
e *pdev)
>>           }
>>             phy->hsic_clk =3D devm_clk_get(dev, "hsic_12M");
>> -        if (IS_ERR(phy->clk)) {
>> +        if (IS_ERR(phy->hsic_clk)) {
>>               dev_err(dev, "failed to get hsic_12M clock\n");
>>               return PTR_ERR(phy->clk);
>>           }
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
