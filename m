From: Domen Puncer <domen@coderock.org>
Date: Sun, 30 Jan 2005 11:44:15 +0000
Subject: [KJ] Re: i810fb: Clean up printk()'s in
Message-Id: <20050130114415.GA3835@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70633098145951245=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70633098145951245==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 25/01/05 17:12 -0600, James Nelson wrote:
> This patch adds KERN_ constants to all of the printk()'s that need them in
> drivers/video/i810/i810_accel.c
> 
> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_accel.c linux-2.6.11-rc2-mm1/drivers/video/i810/i810_accel.c
> --- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_accel.c	2005-01-24 17:15:49.000000000 -0500
> +++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_accel.c	2005-01-24 19:07:03.198260078 -0500
> @@ -34,7 +34,8 @@
>  /* BLT Engine Routines */
>  static inline void i810_report_error(u8 __iomem *mmio)
>  {
> -	printk("IIR     : 0x%04x\n"
> +	printk(KERN_ERR
> +	       "IIR     : 0x%04x\n"
>  	       "EIR     : 0x%04x\n"
>  	       "PGTBL_ER: 0x%04x\n"
>  	       "IPEIR   : 0x%04x\n"

KERN_ERR's missing after some newlines, i think.



	Domen

--===============70633098145951245==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70633098145951245==--
