From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 10 Feb 2005 23:10:43 +0000
Subject: Re: [KJ] [PATCH][20/26] include/linux/* - compile warning cleanup
Message-Id: <20050210231043.GI2958@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88818613846592043=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF83.21250.587255@localhost>
In-Reply-To: <420BEF83.21250.587255@localhost>
To: kernel-janitors@vger.kernel.org

--===============88818613846592043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2005 at 11:34:27PM +0200, Stephen Biggs wrote:
Content-Description: Mail message body
> Description: compile warning cleanup - give RCS id string "unused" 
> attribute to silence compiler warning
> 
> Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> 
> diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h linux-2.6.11-rc3-mm/include/linux/ixjuser.h
> --- linux-2.6.11-rc3-mm-original/include/linux/ixjuser.h	2005-02-03 03:57:05.000000000 +0200
> +++ linux-2.6.11-rc3-mm/include/linux/ixjuser.h	2005-02-08 15:32:55.000000000 +0200
> @@ -42,7 +42,7 @@
>   *
>   *****************************************************************************/
>  
> -static char ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
> +static char  __attribute__((__unused__)) ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
>...

This outdated string should better be killed (together with the only 
usage in ixj.c). If a driver and such a string is maintained it might 
make sense, but in this case it's simply useless.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============88818613846592043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88818613846592043==--
