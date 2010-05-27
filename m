From: Haojian Zhuang <hzhuang1@marvell.com>
Date: Thu, 27 May 2010 02:08:25 +0000
Subject: RE: [patch] mfd/88pm860x: fix uninitialized variable and clean up
Message-Id: <25B60CDC2F704E4E9D88FFD52780CB4C04D6304643@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526225409.GQ22515@bicker>
In-Reply-To: <20100526225409.GQ22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

I'm OK on this patch.

Thanks
Haojian

-----Original Message-----
From: Dan Carpenter [mailto:error27@gmail.com]=20
Sent: 2010=E5=B9=B45=E6=9C=8827=E6=97=A5 6:54 AM
To: Samuel Ortiz
Cc: Haojian Zhuang; Mark Brown; Liam Girdwood; linux-kernel@vger.kernel.org=
; kernel-janitors@vger.kernel.org
Subject: [patch] mfd/88pm860x: fix uninitialized variable and clean up

The original code had a compile warning:
drivers/mfd/88pm860x-core.c:431: warning: =E2=80=98ret=E2=80=99 may be used
	uninitialized in this function
It seems like the warning is valid if either pdata or pdata->touch is
NULL.

This patch checks pdata and pdata->touch at the beginning of the=20
function.  That means everything can be pulled in one indent level.
Now all the statements fit within the 80 character limit.

Also at that point the "use_gpadc" variable isn't needed and removing
it simplifies the logic.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 405d2d5..f9ada69 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -428,52 +428,44 @@ static int __devinit device_gpadc_init(struct pm860x_=
chip *chip,
 {
 	struct i2c_client *i2c =3D (chip->id =3D CHIP_PM8607) ? chip->client \
 				: chip->companion;
-	int use_gpadc =3D 0, data, ret;
+	int data;
+	int ret;
=20
 	/* initialize GPADC without activating it */
=20
-	if (pdata && pdata->touch) {
-		/* set GPADC MISC1 register */
-		data =3D 0;
-		data |=3D (pdata->touch->gpadc_prebias << 1)
-			& PM8607_GPADC_PREBIAS_MASK;
-		data |=3D (pdata->touch->slot_cycle << 3)
-			& PM8607_GPADC_SLOT_CYCLE_MASK;
-		data |=3D (pdata->touch->off_scale << 5)
-			& PM8607_GPADC_OFF_SCALE_MASK;
-		data |=3D (pdata->touch->sw_cal << 7)
-			& PM8607_GPADC_SW_CAL_MASK;
-		if (data) {
-			ret =3D pm860x_reg_write(i2c, PM8607_GPADC_MISC1, data);
-			if (ret < 0)
-				goto out;
-		}
-		/* set tsi prebias time */
-		if (pdata->touch->tsi_prebias) {
-			data =3D pdata->touch->tsi_prebias;
-			ret =3D pm860x_reg_write(i2c, PM8607_TSI_PREBIAS, data);
-			if (ret < 0)
-				goto out;
-		}
-		/* set prebias & prechg time of pen detect */
-		data =3D 0;
-		data |=3D pdata->touch->pen_prebias & PM8607_PD_PREBIAS_MASK;
-		data |=3D (pdata->touch->pen_prechg << 5)
-			& PM8607_PD_PRECHG_MASK;
-		if (data) {
-			ret =3D pm860x_reg_write(i2c, PM8607_PD_PREBIAS, data);
-			if (ret < 0)
-				goto out;
-		}
+	if (!pdata || !pdata->touch)
+		return -EINVAL;
=20
-		use_gpadc =3D 1;
+	/* set GPADC MISC1 register */
+	data =3D 0;
+	data |=3D (pdata->touch->gpadc_prebias << 1) & PM8607_GPADC_PREBIAS_MASK;
+	data |=3D (pdata->touch->slot_cycle << 3) & PM8607_GPADC_SLOT_CYCLE_MASK;
+	data |=3D (pdata->touch->off_scale << 5) & PM8607_GPADC_OFF_SCALE_MASK;
+	data |=3D (pdata->touch->sw_cal << 7) & PM8607_GPADC_SW_CAL_MASK;
+	if (data) {
+		ret =3D pm860x_reg_write(i2c, PM8607_GPADC_MISC1, data);
+		if (ret < 0)
+			goto out;
 	}
-
-	/* turn on GPADC */
-	if (use_gpadc) {
-		ret =3D pm860x_set_bits(i2c, PM8607_GPADC_MISC1,
-				      PM8607_GPADC_EN, PM8607_GPADC_EN);
+	/* set tsi prebias time */
+	if (pdata->touch->tsi_prebias) {
+		data =3D pdata->touch->tsi_prebias;
+		ret =3D pm860x_reg_write(i2c, PM8607_TSI_PREBIAS, data);
+		if (ret < 0)
+			goto out;
 	}
+	/* set prebias & prechg time of pen detect */
+	data =3D 0;
+	data |=3D pdata->touch->pen_prebias & PM8607_PD_PREBIAS_MASK;
+	data |=3D (pdata->touch->pen_prechg << 5) & PM8607_PD_PRECHG_MASK;
+	if (data) {
+		ret =3D pm860x_reg_write(i2c, PM8607_PD_PREBIAS, data);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret =3D pm860x_set_bits(i2c, PM8607_GPADC_MISC1,
+			      PM8607_GPADC_EN, PM8607_GPADC_EN);
 out:
 	return ret;
 }
=FF=F4=E8=BA{.n=C7+=89=B7=9F=AE=89=AD=86+%=8A=CB=FF=B1=E9=DD=B6=17=A5=8Aw=
=FF=BA{.n=C7+=89=B7=A4z=B9=DE=97=F8=DA=9E+h=AE=CF=E2=9E=D8^n=87r=A1=F6=A6z=
=CB=1A=81=EBh=99=A8=E8=AD=DA&=A3=FB=E0z=BF=E4z=B9=DE=97=FA+=80=CA+zf=A3=A2=
=B7h=9A=88=A7~=86=AD=86=DBi=FF=FF=EF=81=EA=FF=91=EA=E7z_=E8=AE=0F=E6j:+v=89=
=A8=FE)=DF=A3=F8m
