From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 25 Jan 2005 23:32:58 +0000
Subject: Re: [KJ] [PATCH 1/53] acornfb: Clean up printk()'s in
Message-Id: <200501260221.05379.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47561989076546096=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125230808.10418.32680.80704@localhost.localdomain>
In-Reply-To: <20050125230808.10418.32680.80704@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============47561989076546096==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:08, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/acornfb.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/acornfb.c

> -	printk("acornfb: freed %dK memory\n", mb_freed);
> +	pr_info("acornfb: freed %dK memory\n", mb_freed);

> -		printk("Acornfb: no valid mode found\n");
> +		printk(KERN_ERR "Acornfb: no valid mode found\n");

Why not make it "_a_cornfb: no valid mode found".

	Alexey

--===============47561989076546096==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47561989076546096==--
