From: Domen Puncer <domen@coderock.org>
Date: Wed, 17 Nov 2004 16:06:50 +0000
Subject: [KJ] [patch] drivers/net/myri_code.h cleanup
Message-Id: <20041117160650.GG8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

A >100k gzipped patch attached.


 myri_code.h | 1283 ------------------------------------------------------------
 1 files changed, 1 insertion(+), 1282 deletions(-)

Signed-off-by: Domen Puncer <domen@coderock.org>

Cleanup initialization to 0.

Basically it does:
-static unsigned char lanai4_data[20472] __initdata = {
-0x00,0x00,
- a bunch of zeroes
-0x00,0x00, 0x00,0x00, 0x00,0x00, } ;
+static unsigned char lanai4_data[20472] __initdata = { };

--vkogqOf2sHV7VnPd
Content-Type: application/x-gunzip
Content-Disposition: attachment; filename="myri_code_cleanup.patch.gz"
Content-Transfer-Encoding: base64

H4sIADBvm0EAA+3OW0sbQRQA4OfmVxzom3HNZF2NjQhpq4LgpWBfisiy5GIW7ArJ2lrE/95E
KPQCfSqFlm/OMJwzZ/jOZFkW495kUX+aLpa9Ztr2Pn5Z1OX4bjLdmr/IUyqylGepiFQMi2KY
726lbyu6qZ9Sp9vtRvV7od/P+oPo7w6303B75xdhNIqsGAx2Nvv53l50n9NBjEad6G3E+3m9
jNVu59M4fX1e1TGp2io2etFZxbKt2noc982yvmmmk6ibNm6rpqqLcv2svJvN4iDSw6viOO2v
uXl1O8s+3y0msWotp+0K6mQ/K+N5tfieucpTMcivoyzrpm6f5x/EYydLDyltPh/xQ/FHUzKZ
TCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lk
MplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaT
yWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplM
JpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQy
mUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJ
ZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwm
k8lkMplMJpPJZDL5P5b7/+CfyWQymUwmk8lkMplMJpPJZDKZTCaTyWQymUwmk8lkMplMJpPJ
ZDKZTCaTyWQymUwmk8nkvyU/xX6nu2yrth7HfbOsb5rpJMbzahG3VVPVRTmp2uoqT8Ugv46y
rJu6Xd/EQTzG034n1vGynk2ms7j8cPbm4rQ8PDo+OT+6LN9enL07OT067HwFQXNTl3TDAQA=

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vkogqOf2sHV7VnPd--
