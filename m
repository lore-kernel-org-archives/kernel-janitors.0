From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 26 Jan 2005 08:40:51 +0000
Subject: Re: [KJ] [PATCH 10/53] cg14: Clean up printk()'s in
Message-Id: <200501261137.06431.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65707895331106547=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125230950.10418.50985.80845@localhost.localdomain>
In-Reply-To: <20050125230950.10418.50985.80845@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============65707895331106547==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:09, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/cg14.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/cg14.c

> -	printk("cg14: cgfourteen at %lx:%lx, %dMB\n",
> +	pr_info("cg14: cgfourteen at %lx:%lx, %dMB\n",
		       ^^^^^^^^^^

Nice duplication, isn't it? :-)

	Alexey

--===============65707895331106547==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65707895331106547==--
