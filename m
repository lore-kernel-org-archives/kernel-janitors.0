From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 24 Mar 2006 10:35:58 +0000
Subject: Re: [KJ] [Patch] convert mtd/devices/doc* to symbol_put functions
Message-Id: <20060324103558.GA7800@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29095922145507247=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143145391.23038.3.camel@alice>
In-Reply-To: <1143145391.23038.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============29095922145507247==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2006 at 09:23:11PM +0100, Eric Sesterhenn wrote:
> this is an attemt at converting the doc mtd drivers from
> inter_module_* functions to symbol_*
> Compile tested with allyes and allmodconfig.
> Please comment, even if it looks halfways sane,

Exporting static functions is something interesting.

> so i know
> i can start working on mtd/chips/cfi* which is the last
> module using this stuff in the kernel.

> --- linux-2.6.16-git6/drivers/mtd/devices/doc2000.c
> +++ linux-2.6.16-git6.new/drivers/mtd/devices/doc2000.c

>  static void DoC2k_init(struct mtd_info *mtd)
>  {
> @@ -622,6 +622,7 @@
>  		return;
>  	}
>  }
> +EXPORT_SYMBOL(DoC2k_init);


--===============29095922145507247==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29095922145507247==--
