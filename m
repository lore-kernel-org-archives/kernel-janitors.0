From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 26 Jan 2005 14:22:39 +0000
Subject: Re: [KJ] [PATCH 45/53] triofb: Clean up printk()'s in
Message-Id: <200501261719.20389.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25266816438850137=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125231517.10418.96578.48707@localhost.localdomain>
In-Reply-To: <20050125231517.10418.96578.48707@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============25266816438850137==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:15, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/S3triofb.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/S3triofb.c

> -	printk("%s: can't find S3 Trio board\n", dp->full_name);
> +	printk(KERN_NOTICE "%s: can't find S3 Trio board\n", dp->full_name);

KERN_NOTICE stands for "normal but significant condition". KERN_ERR instead?

> -	printk("%s: can't find S3 Trio board\n", dp->full_name);
> +	printk(KERN_NOTICE "%s: can't find S3 Trio board\n", dp->full_name);

> -	printk("%s: can't use depth = %d\n", dp->full_name, *pp);
> +	printk(KERN_NOTICE "%s: can't use depth = %d\n", dp->full_name, *pp);

	Alexey

--===============25266816438850137==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25266816438850137==--
