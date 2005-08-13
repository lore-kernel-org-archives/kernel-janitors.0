From: Adrian Bunk <bunk@stusta.de>
Date: Sat, 13 Aug 2005 14:12:14 +0000
Subject: Re: [KJ] argument type of generic_fls()
Message-Id: <20050813141214.GA8393@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72919020925635691=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FDF8E3.5010403@bfs.de>
In-Reply-To: <42FDF8E3.5010403@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============72919020925635691==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 13, 2005 at 03:42:59PM +0200, walter harms wrote:

> hi list,

Hi Walter,

> after the log2 discussion i was looking for log2 in kernel. i found 
> long_log2() in page_alloc.c. What the author actualy wanted was fls().
> To my confusion the generic_fls() searches only 32 bit but has an 
> argument of type int (i would expect uint32).
> Will it create confusion with 64bit int systems ? if anyone considers 
> these a problem i would add a flsl() function and replace the int with 
> uint32.

ints stay 32bit on 64bit systems.

> re
> 	walter

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============72919020925635691==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72919020925635691==--
