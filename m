From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 26 Jan 2005 14:39:29 +0000
Subject: Re: [KJ] [PATCH 53/53] tridentfb: Clean up printk()'s in
Message-Id: <200501261725.38666.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3688771442596086=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125231610.10418.9025.34276@localhost.localdomain>
In-Reply-To: <20050125231610.10418.9025.34276@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============3688771442596086==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:16, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/include/video/trident.h
> +++ linux-2.6.11-rc2-mm1/include/video/trident.h

> -#define output(f, a...) printk("tridentfb: " f, ## a)
> +#define output(f, a...) pr_info("tridentfb: " f, ## a)

drivers/video/tridentfb.c:1165-1168 say:

	if (register_framebuffer(&fb_info) < 0) {
                output("Could not register Trident framebuffer\n");
                return -EINVAL;
	}

So, this patch should be two-liner. ;-)

	Alexey

--===============3688771442596086==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3688771442596086==--
