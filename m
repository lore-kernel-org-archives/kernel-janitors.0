From: Adrian Bunk <bunk@kernel.org>
Date: Sat, 01 Dec 2007 00:20:55 +0000
Subject: Re: const __initdata?
Message-Id: <20071201002055.GQ29463@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.0.9999.0711290227150.25822@localhost.localdomain>
In-Reply-To: <alpine.LFD.0.9999.0711290227150.25822@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 29, 2007 at 08:53:03AM -0800, Randy Dunlap wrote:
> On Thu, 29 Nov 2007 02:28:43 -0500 (EST) Robert P. J. Day wrote:
> 
> > 
> >   from include/linux/init.h:
> > 
> >  * For initialized data:
> >  * You should insert __initdata between the variable name and equal
> >  * sign followed by value, e.g.:
> >  *
> >  * static int init_variable __initdata = 0;
> >  * static char linux_logo[] __initdata = { 0x32, 0x36, ... };
> >  *
> >  * Don't forget to initialize data not at file scope, i.e. within a function,
> >  * as gcc otherwise puts the data into the bss section and not into the init
> >  * section.
> >  *
> >  * Also note, that this data cannot be "const".
> > 
> > you mean, like this in drivers/hwmon/w83627ehf.c:
> > 
> > /* w83627ehf_find() looks for a '627 in the Super-I/O config space */
> > static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
> >                                  struct w83627ehf_sio_data *sio_data)
> > {
> >         static const char __initdata sio_name_W83627EHF[] = "W83627EHF";
> >         static const char __initdata sio_name_W83627EHG[] = "W83627EHG";
> >         static const char __initdata sio_name_W83627DHG[] = "W83627DHG";
> > 	...
> > 
> > or am i misreading that?
> 
> We have certainly seen problems with const __initdata being put
> into a read-only section instead of the .init.data section, but
> with gcc 4.2.1, I see these 3 __initdata items being placed into
> the .init.data section no matter where I put "const" on the data
> declaration line.  Maybe the problem has been fixed (relatively
> recently).

No, the difference is most likely related to the fact that these 
variables are inside a function, and "static" on variables inside a 
function does something different from "static" on variables outside
any function...

> ~Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

