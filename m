From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 21 Jan 2005 10:08:52 +0000
Subject: [KJ] [2.6 patch] generic_serial.h: kill incorrect gs_debug reference
Message-Id: <20050121100852.GF3209@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============094473077784508419=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120220402.GB22673@ens-lyon.fr>
In-Reply-To: <20050120220402.GB22673@ens-lyon.fr>
To: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, linux-kernel@vger.kernel.org

--===============094473077784508419==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 11:04:03PM +0100, Benoit Boissinot wrote:

> Hi,
> 
> the following patch (against latest -mm), correct compilation errors with
> gcc-4.0 (snapshot 20050116).
> 
> please correct me if i did something wrong, this is my first patch
> with the linux kernel.
> 
> Benoit
> 
> diff -Naurp --exclude=ctags linux-clean/drivers/char/generic_serial.c linux-2.6-mm-test/drivers/char/generic_serial.c
> --- linux-clean/drivers/char/generic_serial.c	2005-01-20 22:12:57.000000000 +0100
> +++ linux-2.6-mm-test/drivers/char/generic_serial.c	2005-01-20 21:27:11.000000000 +0100
> @@ -36,7 +36,7 @@
>  static char *                  tmp_buf; 
>  static DECLARE_MUTEX(tmp_buf_sem);
>  
> -static int gs_debug;
> +int gs_debug;
>...

This part seems to be wrong.

Correct patch below.


<--  snip  -->


generic_serial.h contained an incorrect extern reference to the static 
variable gs_debug (Benoit Boissinot reported that gcc 4.0 rejects this).


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.11-rc1-mm2-full/include/linux/generic_serial.h.old	2005-01-20 23:26:07.000000000 +0100
+++ linux-2.6.11-rc1-mm2-full/include/linux/generic_serial.h	2005-01-20 23:26:20.000000000 +0100
@@ -93,6 +93,4 @@
 int  gs_getserial(struct gs_port *port, struct serial_struct __user *sp);
 void gs_got_break(struct gs_port *port);
 
-extern int gs_debug;
-
 #endif


--===============094473077784508419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============094473077784508419==--
