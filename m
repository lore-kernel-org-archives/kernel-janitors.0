From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 25 Jan 2005 23:37:59 +0000
Subject: Re: [KJ] [PATCH 2/53] amifb: Clean up printk()'s in
Message-Id: <200501260230.09880.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52965542299652035=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125230817.10418.45825.41897@localhost.localdomain>
In-Reply-To: <20050125230817.10418.45825.41897@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============52965542299652035==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:08, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/amifb.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/amifb.c

> -		printk("amifb: WARNING! unable to map videomem cached writethrough\n");
> +		printk(KERN_WARNING "amifb: WARNING! unable to map videomem cached writethrough\n");

Can you remove useless "WARNING!" while you are at it?

	Alexey

--===============52965542299652035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52965542299652035==--
