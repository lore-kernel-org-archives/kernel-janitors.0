From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 26 Jan 2005 09:33:18 +0000
Subject: Re: [KJ] [PATCH 26/53] i810fb: Clean up printk()'s in
Message-Id: <200501261229.51018.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96632723397294695=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125231237.10418.29636.65629@localhost.localdomain>
In-Reply-To: <20050125231237.10418.29636.65629@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============96632723397294695==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 26 January 2005 01:12, James Nelson wrote:

> --- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.c
> +++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.c

> @@ -1597,19 +1598,19 @@

> -		printk("i810fb_alloc_fbmem: cannot acquire agpgart\n");
> +		printk(KERN_ERR "i810fb_alloc_fbmem: cannot acquire agpgart\n");

> -		printk("i810fb_alloc_fbmem: can't allocate framebuffer "
> +		printk(KERN_ERR "i810fb_alloc_fbmem: can't allocate framebuffer "

> -		printk("i810fb_alloc_fbmem: can't bind framebuffer memory\n");
> +		printk(KERN_ERR "i810fb_alloc_fbmem: can't bind framebuffer memory\n");

These printk()s are in i810_alloc_agp_mem now. Use "diff -up".

> -		printk("i810fb_alloc_cursormem:  can't allocate" 
> +		printk(KERN_ERR "i810fb_alloc_cursormem: can't allocate" 

Hmm... I haven't found a single matching instance of printk("function: ");
What about using printk(KERN_* "i810fb: ") everywhere and making sure error
messages are different _or_ printk(KERN_* "%s: ", __FUNCTION__ , ...)?

	Alexey

--===============96632723397294695==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96632723397294695==--
