From: Pavel Machek <pavel@ucw.cz>
Date: Wed, 13 Jun 2007 19:46:54 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memcpy(dest, src,
Message-Id: <20070613194653.GA8273@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181616342.2282.8.camel@shani-win> <m1vedtpwks.fsf@ebiederm.dsl.xmission.com> <466ECF37.6040303@zytor.com>
In-Reply-To: <466ECF37.6040303@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Shani Moideen <shani.moideen@wipro.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi!

> >> Replacing memcpy(dest,src,PAGE_SIZE) with copy_page(dest,src) in
> >> arch/i386/kernel/machine_kexec.c.
> > 
> > Please no.
> > 
> > People get creative in copy_page (especially mmx_copy_page),
> > and this code path need something simple and stupid, that
> > will work every time, especially when things are messed up
> > elsewhere.
> 
> memcpy() is pretty creative, too.  If you want something really dumb and
> robust, you should probably create an inline:
> 
> /*
>  * Eric sez: his code path need something simple and stupid, that
>  * will work every time, especially when things are messed up
>  * elsewhere.
>  */
> static inline void braindead_copy_page(void *dst, void *src)
> {
> 	unsigned long ctr = PAGE_SIZE >> 2;
> 
> 	asm volatile("cld; rep; movsl"
> 			: "+D" (dst), "+S" (src), "+c" (ctr)
> 			: : "memory");
> }
> 
> (FWIW, the "cld" is supposed to be redundant, as DF=0 is supposed to be
> guaranteed by the ABI.)

Actually, swsusp would be second user for that. We currently do it
with for loop in C, but...

...well, we'd probably need it for i386, ppc, x86-64, ppc64 and maybe
arm...

(But you should probably add a comment into kexec )
							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
