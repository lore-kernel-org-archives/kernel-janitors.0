From: Vicente Feito <vicente.feito@gmail.com>
Date: Fri, 04 Feb 2005 11:39:32 +0000
Subject: [KJ][PATCH]sound/oss/dmasound/dac3550.c:replace [const]char *s=""	by
Message-Id: <200502041139.32995.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39322773791226329=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39322773791226329==
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline

Hi,
Please consider applying.
Thank you.

Description: Replaces const char *s = "" with const char s[] = "".

Signed-off-by: Vicente Feito <vicente.feito@gmail.com>

--- linux-2.6.10-orig/sound/oss/dmasound/dac3550a.c     2005-02-04 02:09:10.000000000 +0000
+++ linux-2.6.10/sound/oss/dmasound/dac3550a.c  2005-02-04 09:27:37.000000000 +0000
@@ -162,7 +162,7 @@ static int daca_init_client(struct i2c_c

 static int daca_detect_client(struct i2c_adapter *adapter, int address)
 {
-       const char *client_name = "DAC 3550A Digital Equalizer";
+       const char client_name[] = "DAC 3550A Digital Equalizer";
        struct i2c_client *new_client;
        int rc = -ENODEV;


--===============39322773791226329==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39322773791226329==--
