From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 26 Jan 2005 08:35:22 +0000
Subject: Re: [KJ] [PATCH 19/53] cyberfb: Clean up printk()'s in
Message-Id: <200501261133.01885.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64256851271342041=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125231118.10418.95345.88697@localhost.localdomain>
In-Reply-To: <20050125231118.10418.95345.88697@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============64256851271342041==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:11, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/cyberfb.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/cyberfb.c

> -		printk("CV64 driver: Illegal clock frequency %ld, using 25MHz\n",
> +		printk(KERN_WARNING "CV64 driver: Illegal clock frequency %ld, using 25MHz\n",

It's called "cyberfb" in Makefile. Some functions in .c file are
prefixed with "cv64_". I suggest to remove the word "driver" and
choose either "cyberfb" or "cv64".

	Alexey

--===============64256851271342041==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64256851271342041==--
