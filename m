From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 21 Feb 2006 21:12:22 +0000
Subject: Re: [KJ] [PATCH] remove unused variable from drivers/scsi/megaraid.c
Message-Id: <9a8748490602211312s22801796yc52037db6f87d472@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602212158.12473.tim@aapopfiets.nl>
In-Reply-To: <200602212158.12473.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/06, Tim Cooijmans <tim@aapopfiets.nl> wrote:
> From: Tim Cooijmans <tim@aapopfiets.nl>
>
> Fix "unused variable: `flags'" warning in drivers/scsi/megaraid.c:4473
>
> Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
> ---
> --- linux-2.6.16-rc4-orig/drivers/scsi/megaraid.c       2006-02-21
> 20:18:42.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/scsi/megaraid.c    2006-02-21 21:25:38.000000000
> +0100
> @@ -4470,7 +4470,6 @@ mega_internal_command(adapter_t *adapter
>  {
>         Scsi_Cmnd       *scmd;
>         struct  scsi_device *sdev;
> -       unsigned long   flags = 0;
>         scb_t   *scb;
>         int     rval;
>

Just for your information; I recently posted a big patch that fixes
this warning and a bunch of other stuff in megaraid.
That patch is currently pending.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
