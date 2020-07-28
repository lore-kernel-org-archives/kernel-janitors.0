From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Jul 2020 14:50:06 +0000
Subject: Re: [PATCH] m68k/amiga: Add missing platform_device_unregister() call in amiga_init_devices()
Message-Id: <1e12105b-aa72-11a2-74f6-c789f8ceaaa3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qinglang Miao <miaoqinglang@huawei.com>, linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

> Add the missing platform_device_unregister() before return
> from amiga_init_devices() in the error handling case.

Will the tag “Fixes” become helpful for the commit message?


…
> +++ b/arch/m68k/amiga/platform.c
> @@ -188,8 +188,10 @@  static int __init amiga_init_devices(void)
>  			return PTR_ERR(pdev);
>  		error = platform_device_add_data(pdev, &a1200_ide_pdata,
>  						 sizeof(a1200_ide_pdata));
> -		if (error)
> +		if (error) {
> +			platform_device_unregister(pdev);
>  			return error;
> +		}
>  	}
…

I suggest to add a jump target for the desired exception handling.

 		if (error)
+			goto unregister_device;


Regards,
Markus
