From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 25 Jan 2005 23:48:06 +0000
Subject: Re: [KJ] [PATCH 4/53] atyfb: Clean up printk()'s in
Message-Id: <200501260238.48895.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============055976599737422639=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125230846.10418.43702.96380@localhost.localdomain>
In-Reply-To: <20050125230846.10418.43702.96380@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============055976599737422639==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:08, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/aty/atyfb_base.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/aty/atyfb_base.c

> +		pr_debug("debug atyfb: PLL")

Oops, missing ";".

	Alexey

--===============055976599737422639==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============055976599737422639==--
