From: Vicente Feito <vicente.feito@gmail.com>
Date: Sun, 27 Feb 2005 14:50:30 +0000
Subject: Re: [KJ] question ACPI & CMPXCHG
Message-Id: <200502271450.30229.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502271349.20737.vicente.feito@gmail.com>
In-Reply-To: <200502271349.20737.vicente.feito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 27 February 2005 05:01 pm, you wrote:
> On Sun, Feb 27, 2005 at 01:49:20PM +0000, Vicente Feito wrote:
> > Sorry but... isn't already a dependency?
> >
> >         depends on (SMP || PREEMPT) && X86_CMPXCHG
> >
> > Or a dependency where?
> >...
>
> I see this only as a dependency for HAVE_DEC_LOCK, not for ACPI.
>
> Where did you see this as an ACPI dependency?
Adrian,
No, you're right, it's only a HAVE_DEC_LOCK, I've grepped too fast... my bad

Walter, I agree with putting that in the Kconfig, but I still think an error 
it's more scary than a warning, most people don't care that much about 
wasting some compile time, but they do care (and freaks out) when an error 
appears in the compilation process...
Users won't complain for a warning if the overall works fine, but if you give 
them errors, well, they're not going to be happy... (users/admins/people that 
aren't crazy for optimization)

Vicente
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
