From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 19 Oct 2015 15:18:13 +0000
Subject: Re: [patch] mfd: arizona: signedness bug in arizona_runtime_suspend()
Message-Id: <20151019151813.GJ31804@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151019101805.GE26688@mwanda>
In-Reply-To: <20151019101805.GE26688@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

export fullname=3Ddrivers/mfd/arizona-core.c
# From Dan's script
git log --oneline --no-merges mainline/master -- $fullname | head -n 10

3762aed mfd: arizona: Fixup some formatting/white space errors
6887b04 mfd: arizona: Add support for WM8998 and WM1814
16f6a0d mfd: arizona: Fix race between runtime suspend and IRQs
72e4316 mfd: arizona: Fix initialisation of the PM runtime
1115092 mfd: arizona: Fix race between runtime suspend and IRQs
8019ff6 regmap: Use reg_sequence for multi_reg_write / register_patch
fc027d1 mfd: arizona: Split INx_MODE into two fields
121c075 mfd: wm5110: Add delay before releasing reset line
e6cb734 mfd: arizona: Add better support for system suspend
96129a0 mfd: wm5110: Set DCVDD voltage to 1.175V before entering sleep mode

Each of the $subject lines above start with a capital letter. ;)

On Mon, 19 Oct 2015, Dan Carpenter wrote:
> The "jd_active" variable needs to be signed for the error handling to
> work.
>=20
> Fixes: 143e5887ae57 ('mfd: arizona: factor out checking of jack detection=
 state')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 4e49210..d474732 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -628,7 +628,7 @@ err:
>  static int arizona_runtime_suspend(struct device *dev)
>  {
>  	struct arizona *arizona =3D dev_get_drvdata(dev);
> -	unsigned int jd_active =3D 0;
> +	int jd_active =3D 0;
>  	int ret;
> =20
>  	dev_dbg(arizona->dev, "Entering AoD mode\n");

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
