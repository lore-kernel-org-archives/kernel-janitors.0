From: "Yehuda Mor" <praxis@actcom.co.il>
Date: Sun, 01 Aug 2010 11:29:54 +0000
Subject: Remove me!!!!
Message-Id: <!&!AAAAAAAAAAAYAAAAAAAAABQKOav+uulLkhg6V3tT33jCgAAAEAAAALhzLL+AknVFpfYx5gV21voBAAAAAA==@actcom.co.il>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597965-8525-1-git-send-email-segooon@gmail.com> <4C55472E.6000307@ru.mvista.com>
In-Reply-To: <4C55472E.6000307@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>, 'Kulikov Vasiliy' <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, 'David Brownell' <dbrownell@users.sourceforge.net>, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Tony Lindgren' <tony@atomide.com>, 'Cory Maccarrone' <darkstar6262@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org


Please, remove my address praxis@actcom.co.il from your lists! I am
receiving unwanted mail from a lot of people around kernel, ubuntu' debian,
etc - and I have no idea why!

Thank you.  







-----Original Message-----
From: linux-kernel-owner@vger.kernel.org
[mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Sergei Shtylyov
Sent: Sunday, August 01, 2010 1:07 PM
To: Kulikov Vasiliy
Cc: kernel-janitors@vger.kernel.org; David Brownell; Greg Kroah-Hartman;
Tony Lindgren; Cory Maccarrone; linux-usb@vger.kernel.org;
linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] usb: omap_udc: check return value of proc_create()

Hello.

Kulikov Vasiliy wrote:

> proc_create() may fail, if so return -ENOMEM.

> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
[...]
> diff --git a/drivers/usb/gadget/omap_udc.c b/drivers/usb/gadget/omap_udc.c
> index f81e4f0..1083216 100644
> --- a/drivers/usb/gadget/omap_udc.c
> +++ b/drivers/usb/gadget/omap_udc.c
> @@ -2544,9 +2544,9 @@ static const struct file_operations proc_ops = {
>  	.release	= single_release,
>  };
>  
> -static void create_proc_file(void)
> +static int create_proc_file(void)
>  {
> -	proc_create(proc_filename, 0, NULL, &proc_ops);
> +	return (proc_create(proc_filename, 0, NULL, &proc_ops) = NULL);

    Parens not needed around the *return* expression.

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

__________ Information from ESET NOD32 Antivirus, version of virus signature
database 5329 (20100731) __________

The message was checked by ESET NOD32 Antivirus.

http://www.eset.com


 

__________ Information from ESET NOD32 Antivirus, version of virus signature
database 5329 (20100731) __________

The message was checked by ESET NOD32 Antivirus.

http://www.eset.com
 

