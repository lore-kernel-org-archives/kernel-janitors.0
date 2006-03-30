From: Andrew Morton <akpm@osdl.org>
Date: Thu, 30 Mar 2006 00:49:18 +0000
Subject: [KJ] Re: [PATCH] drivers/char/[i]stallion: Clean up kmalloc usage
Message-Id: <20060329164918.79fb7d19.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98582780178642759=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98582780178642759==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Tobias Klauser <tklauser@nuerscht.ch> wrote:
>
> Delete two useless kmalloc wrappers and use kmalloc/kzalloc. Some weird NULL
> checks are also simplified. Compile tested on i386
> 

Fair enough.

> -	stli_tmpwritebuf = (char *) stli_memalloc(STLI_TXBUFSIZE);
> -	if (stli_tmpwritebuf == (char *) NULL)
> +	stli_tmpwritebuf = kmalloc(STLI_TXBUFSIZE, GFP_KERNEL);
> +	if (!stli_tmpwritebuf)
>  		printk(KERN_ERR "STALLION: failed to allocate memory "
>  				"(size=%d)\n", STLI_TXBUFSIZE);
> -	stli_txcookbuf = stli_memalloc(STLI_TXBUFSIZE);
> -	if (stli_txcookbuf == (char *) NULL)
> +	stli_txcookbuf = kmalloc(STLI_TXBUFSIZE, GFP_KERNEL);
> +	if (!stli_txcookbuf)
>  		printk(KERN_ERR "STALLION: failed to allocate memory "
>  				"(size=%d)\n", STLI_TXBUFSIZE);

If either of these allocations fail this driver will take the whole machine
out.  If someone's feeling bored, we should teach the driver to back out of
the init function, fail the modprobe.

--===============98582780178642759==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98582780178642759==--
