From: Adrian Bunk <bunk@fs.tum.de>
Date: Sun, 18 Jan 2004 12:53:22 +0000
Subject: Re: [Kernel-janitors] [rfc] a lot of unused CONFIG_*
Message-Id: <20040118125322.GP12027@fs.tum.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200401171704.40353.domen@coderock.org>
In-Reply-To: <200401171704.40353.domen@coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 17, 2004 at 05:04:40PM +0100, Domen Puncer wrote:
> Hi.
> 
> # wc -l CONFIG_defined_but_not_used CONFIG_not_defined_but_used
>     116 CONFIG_defined_but_not_used
>     635 CONFIG_not_defined_but_used
> 
> This is a lot!
> 
> I didn't strip out "*_MODULE" (don't know if they're automagicaly
> generated and it doesn't make much difference).

These symbols are automatically generated when configuring a variable to 
be modular.

> So... am I wrong about my script, or do we have A LOT of work to do?
>...

It's sometimes used and 100% correct to define options that are only 
used in the Kconfig file they are defined in.
Examples are some cpu variables in from arch/i386/Kconfig .

It often occurs that a variable is only used in a Makefile to select a 
subdirectory (e.g. CONFIG_E1000), but your scripts didn't count this 
use.

Not all Kconfig files are named Kconfig, Kconfig\* is a better 
expression.

Not all things your script output are really bugs, e.g. there might be 
an #ifdef CONFIG_FOO in the code without CONFIG_FOO being defined 
anywhere, but it's defined in another tree (e.g. an architecture tree) 
that will be resynced with the kernel soon.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
