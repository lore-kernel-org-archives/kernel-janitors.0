From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:14:16 +0000
Subject: [KJ] [PATCH] drivers/ide/ide-tape.c : Use of the time_after() macro
Message-Id: <42D8B3C8.8020208@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050201020400050201010803"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CED33B.4000600@feitoza.com.br>
In-Reply-To: <42CED33B.4000600@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050201020400050201010803
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------050201020400050201010803
Content-Type: text/x-patch;
 name="ide-tape.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide-tape.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/ide/ide-tape.c	2005-07-13 17:53:26.000000000 -0300
+++ linux-kj/drivers/ide/ide-tape.c	2005-07-14 15:11:05.561899880 -0300
@@ -2495,7 +2495,8 @@
 			} else {
 				return ide_do_reset(drive);
 			}
-		} else if (jiffies - tape->dsc_polling_start > IDETAPE_DSC_MA_THRESHOLD)
+		} else if (time_after(jiffies, tape->dsc_polling_start
+					+ IDETAPE_DSC_MA_THRESHOLD))
 			tape->dsc_polling_frequency = IDETAPE_DSC_MA_SLOW;
 		idetape_postpone_request(drive);
 		return ide_stopped;

--------------050201020400050201010803
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050201020400050201010803--
