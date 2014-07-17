From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 16:28:21 +0000
Subject: [PATCH 3/4]  drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c: drop incorrect checks
Message-Id: <1405614501-4554-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Cc: gregkh@linuxfoundation.org, knivey@botops.net, hsweeten@visionengravers.com, abbotti@mev.co.uk, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Dropped some "< 0" and ">=3D 0" checks on unsigned int values.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80501
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 .../comedi/drivers/addi-data/hwdrv_apci3200.c        | 20 ++++++++++------=
----
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c b/dr=
ivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
index a3026a2..3a215ac 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
@@ -1750,34 +1750,34 @@ static int apci3200_ai_config(struct comedi_device =
*dev,
 	/* END JK 06.07.04: Management of sevrals boards */
=20
 	if (data[5] =3D 0) {
-		if (ui_ChannelNo < 0 || ui_ChannelNo > 15) {
+		if (ui_ChannelNo > 15) {
 			printk("\nThe Selection of the channel is in error\n");
 			i_err++;
-		}		/*  if(ui_ChannelNo<0 || ui_ChannelNo>15) */
+		}		/*  if(ui_ChannelNo>15) */
 	}			/* if(data[5]=3D0) */
 	else {
 		if (data[14] =3D 2) {
-			if (ui_ChannelNo < 0 || ui_ChannelNo > 3) {
+			if (ui_ChannelNo > 3) {
 				printk("\nThe Selection of the channel is in error\n");
 				i_err++;
-			}	/*  if(ui_ChannelNo<0 || ui_ChannelNo>3) */
+			}	/*  if(ui_ChannelNo>3) */
 		}		/* if(data[14]=3D2) */
 		else {
-			if (ui_ChannelNo < 0 || ui_ChannelNo > 7) {
+			if (ui_ChannelNo > 7) {
 				printk("\nThe Selection of the channel is in error\n");
 				i_err++;
-			}	/*  if(ui_ChannelNo<0 || ui_ChannelNo>7) */
+			}	/*  if(ui_ChannelNo>7) */
 		}		/* elseif(data[14]=3D2) */
 	}			/* elseif(data[5]=3D0) */
 	if (data[12] =3D 0 || data[12] =3D 1) {
 		switch (data[5]) {
 		case 0:
-			if (ui_ChannelNo >=3D 0 && ui_ChannelNo <=3D 3) {
+			if (ui_ChannelNo <=3D 3) {
 				/* BEGIN JK 06.07.04: Management of sevrals boards */
 				/* i_Offset=3D0; */
 				s_BoardInfos[dev->minor].i_Offset =3D 0;
 				/* END JK 06.07.04: Management of sevrals boards */
-			}	/* if(ui_ChannelNo >=3D0 && ui_ChannelNo <=3D3) */
+			}	/* if(ui_ChannelNo <=3D3) */
 			if (ui_ChannelNo >=3D 4 && ui_ChannelNo <=3D 7) {
 				/* BEGIN JK 06.07.04: Management of sevrals boards */
 				/* i_Offsetd; */
@@ -1831,12 +1831,12 @@ static int apci3200_ai_config(struct comedi_device =
*dev,
 				ui_ChannelNo =3D 0;
 				break;
 			}	/* if(data[14]=3D2) */
-			if (ui_ChannelNo >=3D 0 && ui_ChannelNo <=3D 1) {
+			if (ui_ChannelNo <=3D 1) {
 				/* BEGIN JK 06.07.04: Management of sevrals boards */
 				/* i_Offset=3D0; */
 				s_BoardInfos[dev->minor].i_Offset =3D 0;
 				/* END JK 06.07.04: Management of sevrals boards */
-			}	/* if(ui_ChannelNo >=3D0 && ui_ChannelNo <=3D1) */
+			}	/* if(ui_ChannelNo <=3D1) */
 			if (ui_ChannelNo >=3D 2 && ui_ChannelNo <=3D 3) {
 				/* BEGIN JK 06.07.04: Management of sevrals boards */
 				/* i_ChannelNo=3Di_ChannelNo-2; */
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
