From: Domen Puncer <domen@coderock.org>
Date: Sat, 22 Jan 2005 18:50:47 +0000
Subject: Re: [KJ] [PATCH 1/2] acorn: clean up printk()'s in
Message-Id: <20050122185047.GB28104@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56520188369291913=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050121010751.18138.42311.24615@localhost.localdomain>
In-Reply-To: <20050121010751.18138.42311.24615@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============56520188369291913==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/01/05 19:07 -0600, James Nelson wrote:
> Signed-off-by: James Nelson <james4765@gmail.com>
> 

ENODESC

> diff -urN --exclude='*~' linux-2.6.11-rc1-mm2-original/drivers/acorn/block/fd1772.c linux-2.6.11-rc1-mm2/drivers/acorn/block/fd1772.c
> --- linux-2.6.11-rc1-mm2-original/drivers/acorn/block/fd1772.c	2005-01-20 16:33:13.000000000 -0500
> +++ linux-2.6.11-rc1-mm2/drivers/acorn/block/fd1772.c	2005-01-20 19:56:54.542776654 -0500
> @@ -180,6 +175,13 @@
>  #define DEVICE_NAME "floppy"
>  #define QUEUE (floppy_queue)
>  #define CURRENT elv_next_request(floppy_queue)
> +#define PFX DEVICE_NAME ": "
> +
> +#ifdef DEBUG
> +#define DBG(fmt, args...) pr_debug(PFX "%s(): " fmt, __FUNCTION__ , ## args)
> +#else
> +#define DBG(fmt, args...)
> +#endif

This #ifdef is not needed.

> @@ -1418,14 +1419,15 @@
>  {
>  	int drive, cnt = 0;
>  
> -	printk("Probing floppy drive(s):\n");
> +	pr_info("Probing floppy drive(s):);

					^^
Missing ".
Was this compile tested?


	Domen

--===============56520188369291913==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56520188369291913==--
