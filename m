From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 01 Dec 2005 23:11:54 +0000
Subject: Re: [KJ] [Q] if (x) kfree(x) ?
Message-Id: <20051201231154.GY31395@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46324713041745924=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <003401c5f6c6$f9f30ce0$0100a8c0@bureau>
In-Reply-To: <003401c5f6c6$f9f30ce0$0100a8c0@bureau>
To: kernel-janitors@vger.kernel.org

--===============46324713041745924==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2005 at 11:31:29PM +0100, Christophe Jaillet wrote:
> In many places in the kernel source, piece of code such as the following can
> be seen :
> 
> in /net/ipv4/ip_sockglue.c
> +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
>    if (msf)
>     kfree(msf);
>    if (gsf)
>     kfree(gsf);
> +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
> 
> or ugglier in /drivers/char/istallion.c
> +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
>  if (stli_tmpwritebuf != (char *) NULL)
>   kfree(stli_tmpwritebuf);
>  if (stli_txcookbuf != (char *) NULL)
>   kfree(stli_txcookbuf);
> +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

Both are already changed in 2.6.15-rc4.

> The test againt NULL is already done in kfree, so there is aparently no need
> to test it before calling kfree. As I don't know if there are another issues
> (speed, ...) I just point it out to you and ask if you think it would be a
> good idea to remove these tests against NULL from the kernel source.
> 
> Any comment ?

Generally, there is not much reason for such a NULL check (there could 
in theory speed reasons in favor of "if (unlikely(foo)) kfree(foo);", 
but only in extremely rare cases (especially since the bigger amount of 
code has a negative effect on the speed)).

Jesper is already sending tons of paches in this area, and it's 
therefore not a good idea for you to work on the same issue.

> CJ

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============46324713041745924==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46324713041745924==--
