From: Vicente Feito <vicente.feito@gmail.com>
Date: Fri, 04 Feb 2005 11:41:24 +0000
Subject: [KJ][PATCH]sound/oss/dmasound/tas_common.c:replace [const]char	*s=""
Message-Id: <200502041141.24844.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3777445310561649=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3777445310561649==
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline

Hi,
Please consider applying.
Thank you.

Description: Replaces static const char *s = "" with static const char s[] = "".

Signed-off-by: Vicente Feito <vicente.feito@gmail.com>

--- linux-2.6.10-orig/sound/oss/dmasound/tas_common.c   2005-02-04 02:09:10.000000000 +0000
+++ linux-2.6.10/sound/oss/dmasound/tas_common.c        2005-02-04 09:22:40.000000000 +0000
@@ -126,7 +126,7 @@ tas_post_init(void)
 static int
 tas_detect_client(struct i2c_adapter *adapter, int address)
 {
-       static const char *client_name = "tas Digital Equalizer";
+       static const char client_name[] = "tas Digital Equalizer";
        struct i2c_client *new_client;
        int rc = -ENODEV;


--===============3777445310561649==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3777445310561649==--
