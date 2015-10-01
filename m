From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 01 Oct 2015 11:51:00 +0000
Subject: Re: [patch] mfd: 64 bit bug in bxtwc_val_store()
Message-Id: <20151001115100.GR3214@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150928095636.GB11367@mwanda>
In-Reply-To: <20150928095636.GB11367@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

I will fix the subject line for this patch, but in future please use
the format akin to the individual subsystem.

In the MFD case this is:

  mfd: <device>: <Summary starting with an uppercase character>

> The call to kstrtoul() will corrupt memory on 64 bit systems because an
> int is 4 bytes and a long is 8.
>=20
> Also it's not a good idea to let users trigger a dev_err() because it
> just ends up flooding /var/log/messages so I removed the printk.
>=20
> Fixes: 2ddd2086ea9c ('mfd: add Intel Broxton Whiskey Cove PMIC driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_p=
mic_bxtwc.c
> index 40acaff..b942876 100644
> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -297,10 +297,9 @@ static ssize_t bxtwc_val_store(struct device *dev,
>  	unsigned int val;
>  	struct intel_soc_pmic *pmic =3D dev_get_drvdata(dev);
> =20
> -	if (kstrtoul(buf, 0, (unsigned long *)&val)) {
> -		dev_err(dev, "Invalid register value\n");
> -		return -EINVAL;
> -	}
> +	ret =3D kstrtouint(buf, 0, &val);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D regmap_write(pmic->regmap, bxtwc_reg_addr, val);
>  	if (ret) {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
