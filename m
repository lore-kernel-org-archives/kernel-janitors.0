From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 27 Feb 2005 16:37:01 +0000
Subject: Re: [KJ] question ACPI & CMPXCHG
Message-Id: <20050227163701.GC6148@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76102248973266917=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502271349.20737.vicente.feito@gmail.com>
In-Reply-To: <200502271349.20737.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============76102248973266917==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 27, 2005 at 05:17:36PM +0100, walter harms wrote:
> hi list,
> when i was looking into arch/i386/kernel/acpi/boot.c
> 
> i found:
> 
> #ifndef __HAVE_ARCH_CMPXCHG
> #warning ACPI uses CMPXCHG, i486 and later hardware
> #endif
> 
> 
> perhaps its nitpicking but ...
> I think the setup should disable ACPI if CMPXCHG does not exist.
> second best generate at least an error ! compile time these day is short 
> and you have a good change to miss warnings.
>...
> --- boot.c.org  2005-02-27 17:10:24.000000000 +0100
> +++ boot.c      2005-02-27 17:11:58.000000000 +0100
> @@ -82,7 +82,7 @@
>  #endif
> 
>  #ifndef __HAVE_ARCH_CMPXCHG
> -#warning ACPI uses CMPXCHG, i486 and later hardware
> +#error  ACPI requires CMPXCHG
>  #endif
>...

This is wrong - instead of an error this should be put as a dependency 
into the Kconfig file.

But the underlying issue is that the current config semantics is, that 
"386" means a generic kernel. I should make a new version of my patch of 
a new i386 cpu selection for allowing a proper handling of such cases.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============76102248973266917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76102248973266917==--
