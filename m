From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 10 Feb 2005 23:13:27 +0000
Subject: Re: [KJ] [PATCH][16/26] drivers/telephony/* - compile warning cleanup
Message-Id: <20050210231327.GK2958@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51868634739051322=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.15430.587449@localhost>
In-Reply-To: <420BEF84.15430.587449@localhost>
To: kernel-janitors@vger.kernel.org

--===============51868634739051322==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2005 at 11:34:28PM +0200, Stephen Biggs wrote:
Content-Description: Mail message body
> Description: compile warning cleanup - give RCS id string "unused" 
> attribute to silence compiler warning
> 
> Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> 
> diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h linux-2.6.11-rc3-mm/drivers/telephony/ixj.h
> --- linux-2.6.11-rc3-mm-original/drivers/telephony/ixj.h	2005-02-03 03:57:04.000000000 +0200
> +++ linux-2.6.11-rc3-mm/drivers/telephony/ixj.h	2005-02-08 15:32:32.000000000 +0200
> @@ -38,7 +38,7 @@
>   * TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
>   *
>   *****************************************************************************/
> -static char ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
> +static char __attribute__((__unused__)) ixj_h_rcsid[] = "$Id: ixj.h,v 4.1 2001/08/04 14:49:27 craigs Exp $";
>...

Please kill this string, too.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============51868634739051322==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51868634739051322==--
