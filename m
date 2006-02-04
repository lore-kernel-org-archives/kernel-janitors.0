From: Adrian Bunk <bunk@stusta.de>
Date: Sat, 04 Feb 2006 16:47:31 +0000
Subject: Re: [KJ] [PATCH] MODULE_VERSION()
Message-Id: <20060204164730.GA7626@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78554302400801079=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139062125.8030.4.camel@localhost.localdomain>
In-Reply-To: <1139062125.8030.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============78554302400801079==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 04, 2006 at 08:08:45AM -0600, Matthew Martin wrote:
>...
> @@ -95,10 +95,13 @@
>  #include "onetouch.h"
>  #endif
>  
> +#define DRV_VERSION "1.75"
> +
>  /* Some informational data */
>  MODULE_AUTHOR("Matthew Dharm <mdharm-usb@one-eyed-alien.net>");
>  MODULE_DESCRIPTION("USB Mass Storage driver for Linux");
>  MODULE_LICENSE("GPL");
> +MODULE_VERSION(DRV_VERSION);
>...

Do we really want to make each ancient driver version string 
user-visible?

This is not your fault, it does IMHO not belong to the TODO.

There is a very limited area where active driver maintainers are 
maintaining a version number in a way that printing it does make sense.

But in all other cases, the kernel version is the best way to identify a 
driver.

E.g. in this case, the driver in the more than two years old kernel 
2.6.0 prints exactly the same version 1.75 .

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============78554302400801079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78554302400801079==--
