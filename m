From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 19 Oct 2006 19:19:53 +0000
Subject: Re: [KJ] [PATCH] Replaced tty->driver_data lines with
Message-Id: <20061019191953.GL2602@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4537CBE3.4080809@gmail.com>
In-Reply-To: <4537CBE3.4080809@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David KOENIG <karhudever@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Thu, Oct 19, 2006 at 12:02:59PM -0700, David KOENIG wrote:
> +++ b/fs/compat_ioctl.c
> @@ -1270,7 +1270,7 @@ static int do_kdfontop_ioctl(unsigned in
>  		return -EPERM;
>  	op.data = compat_ptr(((struct console_font_op32 *)&op)->data);
>  	op.flags |= KD_FONT_FLAG_OLD;
> - -	vc = ((struct tty_struct *)file->private_data)->driver_data;
> +	vc = pci_get_drvdata((struct tty_struct *)file->private_data);

Did you even compile this?  pci_get_drvdata doesn't take a struct
tty_struct *, it takes a struct pci_dev *.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
