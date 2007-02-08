From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Thu, 08 Feb 2007 10:23:05 +0000
Subject: Re: [KJ] [Fwd: Re:  Taking the Min and Max macro job]
Message-Id: <1170929465.3571.27.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Mehul,

	I had been on this sometime back. Im not sure if u can change the
entries in xdr*.c
	These files use the macro to initialize static struct where u cannot
use statements within expression.

      http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html

	So in the xdr*.c files I think we should not change the macros or we
should be adding one more macro like the ones used in those files to
kernel.h which does not perform the type check.

	I had one more doubt...I had been through some other files that have
same simple MIN/MAX macros that are like those in xdr*.c. Can we include
kernel.h in any of these files and remove the extra definition in those
files?
	Wouldnt it be better if we declare all the macros in kernel.h in a
separate file say kernel-macros.h or util-macros.h and have that
included in the code than including the kernel.h itself as in a number
of instances we may not need the other entries in kernel.h to be
accessible in the code.


> -------- Forwarded Message --------
> From: Mehul Jani <mehul.jani@gmail.com>
> To: kernel-janitors@lists.osdl.org
> Subject: Re: [KJ] Taking the Min and Max macro job
> Date: Thu, 8 Feb 2007 14:59:41 +0530
> 
> I had started the activity. changed the handcrafted MAX macro to *max*
> from the kernel.h in the xdr4.c file ( no quite sure of the complete
> file name)  
>  
> the max macro is applied in struct , i changed it and recompile failed.
> 
>  
> On 2/8/07, Alexey Dobriyan <adobriyan@gmail.com> wrote: 
>         On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish
>         wrote:
>         > It seems that no one is assigned the Min and Max macro job.
>         I'll take 
>         > it if no one seems interested.
>         >
>         > Well, I hope this to become my last brain-dead patch
>         series :).
>         
>         Be very very careful to not add integer overflows.
>         
>         _______________________________________________ 
>         Kernel-janitors mailing list
>         Kernel-janitors@lists.osdl.org
>         https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
