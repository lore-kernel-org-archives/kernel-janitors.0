From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 16 Jun 2020 13:04:57 +0000
Subject: Re: [PATCH][next] mtd: rawnand: qcom: fix incorrect masking operator, used & instead of |
Message-Id: <2df422ef-5e47-ed5b-31b0-58b29f2f0f8e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616115125.74298-1-colin.king@canonical.com>
 <20200616145756.4875d0c6@xps13>
In-Reply-To: <20200616145756.4875d0c6@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On 16/06/2020 13:57, Miquel Raynal wrote:
> Hi Colin,
>=20
> Colin King <colin.king@canonical.com> wrote on Tue, 16 Jun 2020
> 12:51:25 +0100:
>=20
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the expression (nand_ctrl | BAM_MODE_EN) is always true no
>> matter the value of nand_ctrl because the incorrect masking operator
>> is being used.  Fix this by using bit-wise & instead of |.
>=20
> I saw it when reviewing and marked it to solve before applying but it
> looks like I forgot to do so. If you don't mind I'll merge this with
> the original commit.
>=20
>>
>> Addresses-Coverity: ("Wrong operator used")
>> Fixes: dd0c1fc8de12 ("mtd: rawnand: qcom: set BAM mode only if not set a=
lready")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qc=
om_nandc.c
>> index a3ef4288be27..37d95532ba7e 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -2790,7 +2790,7 @@ static int qcom_nandc_setup(struct qcom_nand_contr=
oller *nandc)
>>  		 * only if it is not in BAM mode. In most cases BAM
>>  		 * mode will be enabled in bootloader
>>  		 */
>> -		if (!(nand_ctrl | BAM_MODE_EN))
>> +		if (!(nand_ctrl & BAM_MODE_EN))
>>  			nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
>>  	} else {
>>  		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>=20
> Thanks,
> Miqu=C3=A8l
>=20

Sure merge it.

Colin
