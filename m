From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 27 Feb 2005 17:01:12 +0000
Subject: Re: [KJ] question ACPI & CMPXCHG
Message-Id: <20050227170112.GD6148@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26677116381106813=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502271349.20737.vicente.feito@gmail.com>
In-Reply-To: <200502271349.20737.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============26677116381106813==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 27, 2005 at 01:49:20PM +0000, Vicente Feito wrote:

> Sorry but... isn't already a dependency?
> 
>         depends on (SMP || PREEMPT) && X86_CMPXCHG
> 
> Or a dependency where?
>...

I see this only as a dependency for HAVE_DEC_LOCK, not for ACPI.

Where did you see this as an ACPI dependency?

> Vicente

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============26677116381106813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26677116381106813==--
