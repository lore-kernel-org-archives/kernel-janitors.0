From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 16:27:16 +0000
Subject: [PATCH 2/4] drivers/staging/media/davinci_vpfe/dm365_ipipeif.c: fix negativity check
Message-Id: <1405614436-4506-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Cc: gregkh@linuxfoundation.org, m.chehab@samsung.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c:210]:
(style) Checking if unsigned variable 'val' is less than zero.

    val =3D get_oneshot_mode(ipipeif->input);
    if (val < 0) {
        pr_err("ipipeif: links setup required");
        return -EINVAL;
    }

but

static int get_oneshot_mode(enum ipipeif_input_entity input)

Introduced temporary variable for negativity check.
"val" is afterwards used in a lot of bitwise operations, so changing its ty=
pe
to signed is not safe, according to CERT C Secure Coding Standards chapter
INT13-C: "Use bitwise operators only on unsigned operands"
https://www.securecoding.cert.org/confluence/display/seccode/INT13-C.+Use+b=
itwise+operators+only+on+unsigned+operands

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80521
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c b/drivers/s=
taging/media/davinci_vpfe/dm365_ipipeif.c
index 59540cd..6d4893b 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
@@ -196,6 +196,7 @@ static int ipipeif_hw_setup(struct v4l2_subdev *sd)
 	int data_shift;
 	int pack_mode;
 	int source1;
+	int tmp;
=20
 	ipipeif_base_addr =3D ipipeif->ipipeif_base_addr;
=20
@@ -206,8 +207,8 @@ static int ipipeif_hw_setup(struct v4l2_subdev *sd)
 	outformat =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE];
=20
 	/* Combine all the fields to make CFG1 register of IPIPEIF */
-	val =3D get_oneshot_mode(ipipeif->input);
-	if (val < 0) {
+	tmp =3D val =3D get_oneshot_mode(ipipeif->input);
+	if (tmp < 0) {
 		pr_err("ipipeif: links setup required");
 		return -EINVAL;
 	}
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
