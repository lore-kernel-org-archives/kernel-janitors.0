From: Joe Perches <joe@perches.com>
Date: Sun, 27 Mar 2016 19:22:04 +0000
Subject: Re: [PATCH 4/5] staging: xgifb: fix comparison order
Message-Id: <1459106524.25110.12.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
	 <1459105983-17251-4-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-4-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Clifton Barnes <clifton.a.barnes@gmail.com>, arnaud.patard@rtp-net.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org

On Sun, 2016-03-27 at 15:13 -0400, Clifton Barnes wrote:
> fix checkpatch.pl warning about 'Comparisons should place the constant
> on the right side of the test'

checkpatch false positives.

> Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
> ---
> =A0drivers/staging/xgifb/vb_setmode.c | 4 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/v=
b_setmode.c
> index 50c8ea4..8bf253c 100644
> --- a/drivers/staging/xgifb/vb_setmode.c
> +++ b/drivers/staging/xgifb/vb_setmode.c
> @@ -1208,7 +1208,7 @@ static void const *XGI_GetLcdPtr(struct XGI330_LCDD=
ataTablStruct const *table,
> =A0		if (pVBInfo->LCDInfo & EnableScalingLCD)
> =A0			tempdx &=3D (~PanelResInfo);
> =A0
> -		if (table[i].PANELID =3D tempdx) {
> +		if (tempdx =3D table[i].PANELID) {
> =A0			tempbx =3D table[i].MASK;
> =A0			tempdx =3D pVBInfo->LCDInfo;
> =A0
> @@ -3902,7 +3902,7 @@ static struct XGI301C_Tap4TimingStruct const
> =A0
> =A0	i =3D 0;
> =A0	while (Tap4TimingPtr[i].DE !=3D 0xFFFF) {
> -		if (Tap4TimingPtr[i].DE =3D tempax)
> +		if (tempax =3D Tap4TimingPtr[i].DE)
> =A0			break;
> =A0		i++;
> =A0	}
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
