From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 22 Feb 2006 00:14:40 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <Pine.LNX.4.58.0602211612250.12588@shark.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99386680018694729=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============99386680018694729==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 22 Feb 2006, Eric Sesterhenn wrote:

> On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> > This looks broken - did you even compile test that patch?
> >
> > Don't you mean :
> >
> > return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
>
> *yuck*, sorry for this, didnt compile test since it doesnt build
> with my config. fixed patch below.

Your config is really easy to change to that it will build,
isn't it?
Let's see, PROC_KCORE requires PROC_FS and MMU.
Does your kernel build with MMU enabled?
Cause PROC_FS is really easy to change...

> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
>
> --- linux-2.6.16-rc4/fs/proc/kcore.c.orig	2006-02-21 23:58:12.000000000 +0100
> +++ linux-2.6.16-rc4/fs/proc/kcore.c	2006-02-21 23:58:48.000000000 +0100
> @@ -282,12 +282,11 @@ read_kcore(struct file *file, char __use
>  		tsz = elf_buflen - *fpos;
>  		if (buflen < tsz)
>  			tsz = buflen;
> -		elf_buf = kmalloc(elf_buflen, GFP_ATOMIC);
> +		elf_buf = kzalloc(elf_buflen, GFP_ATOMIC);
>  		if (!elf_buf) {
>  			read_unlock(&kclist_lock);
>  			return -ENOMEM;
>  		}
> -		memset(elf_buf, 0, elf_buflen);
>  		elf_kcore_store_hdr(elf_buf, nphdr, elf_buflen);
>  		read_unlock(&kclist_lock);
>  		if (copy_to_user(buffer, elf_buf + *fpos, tsz)) {
> @@ -333,10 +332,9 @@ read_kcore(struct file *file, char __use
>  			unsigned long curstart = start;
>  			unsigned long cursize = tsz;
>
> -			elf_buf = kmalloc(tsz, GFP_KERNEL);
> +			elf_buf = kzalloc(tsz, GFP_KERNEL);
>  			if (!elf_buf)
>  				return -ENOMEM;
> -			memset(elf_buf, 0, tsz);
>
>  			read_lock(&vmlist_lock);
>  			for (m=vmlist; m && cursize; m=m->next) {
> --- linux-2.6.16-rc4/fs/proc/vmcore.c.orig	2006-02-21 23:54:00.000000000 +0100
> +++ linux-2.6.16-rc4/fs/proc/vmcore.c	2006-02-21 23:54:59.000000000 +0100
> @@ -179,12 +179,7 @@ struct file_operations proc_vmcore_opera
>
>  static struct vmcore* __init get_new_element(void)
>  {
> -	struct vmcore *p;
> -
> -	p = kmalloc(sizeof(*p), GFP_KERNEL);
> -	if (p)
> -		memset(p, 0, sizeof(*p));
> -	return p;
> +	return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
>  }
>
>  static u64 __init get_vmcore_size_elf64(char *elfptr)
>
>
>

-- 
~Randy

--===============99386680018694729==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99386680018694729==--
