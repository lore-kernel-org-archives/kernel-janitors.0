From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 16 Jun 2020 12:57:56 +0000
Subject: Re: [PATCH][next] mtd: rawnand: qcom: fix incorrect masking operator, used & instead of |
Message-Id: <20200616145756.4875d0c6@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616115125.74298-1-colin.king@canonical.com>
In-Reply-To: <20200616115125.74298-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue, 16 Jun 2020
12:51:25 +0100:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the expression (nand_ctrl | BAM_MODE_EN) is always true no
> matter the value of nand_ctrl because the incorrect masking operator
> is being used.  Fix this by using bit-wise & instead of |.

I saw it when reviewing and marked it to solve before applying but it
looks like I forgot to do so. If you don't mind I'll merge this with
the original commit.

>=20
> Addresses-Coverity: ("Wrong operator used")
> Fixes: dd0c1fc8de12 ("mtd: rawnand: qcom: set BAM mode only if not set al=
ready")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index a3ef4288be27..37d95532ba7e 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2790,7 +2790,7 @@ static int qcom_nandc_setup(struct qcom_nand_contro=
ller *nandc)
>  		 * only if it is not in BAM mode. In most cases BAM
>  		 * mode will be enabled in bootloader
>  		 */
> -		if (!(nand_ctrl | BAM_MODE_EN))
> +		if (!(nand_ctrl & BAM_MODE_EN))
>  			nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
>  	} else {
>  		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);

Thanks,
Miqu=C3=A8l
