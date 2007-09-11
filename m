From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 11 Sep 2007 21:21:53 +0000
Subject: Re: does '__setup("dscc4.setup=", dscc4_setup);' make any sense?
Message-Id: <Pine.LNX.4.64.0709111645210.29048@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 11 Sep 2007, Randy Dunlap wrote:

> On Tue, 11 Sep 2007 15:41:02 -0400 (EDT) Robert P. J. Day wrote:
...
> > __setup("dscc4.setup=", dscc4_setup);

> You are correct AFAIK.  Please check with the driver maintainer:
>
> DSCC4 DRIVER
> P:	Francois Romieu
> M:	romieu@fr.zoreil.com
> L:	netdev@vger.kernel.org
> S:	Maintained

  before i do that, there are a couple things i want to clarify, since
i think i *just* twigged on how all this hangs together.

AIUI, there are two ways to define your basic kernel boot-time parms:

  a)  __setup(), or
  b)   early_param()

  for the most part, these macros are used to define boot-time parms
that you'd normally consider *really* fundamental -- that is, parms
related to code that is *always* compiled into the kernel.  as in:

$ grep -rw __setup arch/i386/kernel
arch/i386/kernel/acpi/sleep.c:__setup("acpi_sleep=", acpi_sleep_setup);
arch/i386/kernel/reboot.c:__setup("reboot=", reboot_setup);
arch/i386/kernel/traps.c:__setup("kstack=", kstack_setup);
arch/i386/kernel/traps.c:__setup("code_bytes=", code_bytes_setup);
arch/i386/kernel/hpet.c:__setup("hpet=", hpet_setup);
arch/i386/kernel/cpu/mcheck/mce.c:__setup("nomce", mcheck_disable);
arch/i386/kernel/cpu/mcheck/mce.c:__setup("mce", mcheck_enable);
...
$

  that is, if you look at the above, all of that code is guaranteed to
be compiled into the kernel no matter what your configuration
selections -- no modular builds for any of *that* stuff.  so far, so
good?

  at the other end, if you have code (perhaps driver code) that
*could* be selected as either built-in or modular, and it has standard
module parameters, then if you choose to build that code into the
kernel, you *automatically* get access to the corresponding parameters
with the syntax "modulename.paramname=whatever" at the kernel boot
line.  there is no need to "__setup" those things -- you can just
access them from the boot line.  again, sound reasonable?  but here's
the part that i want to make sure i understand.

  as i read it, you can pretty much use __setup() to define boot-time
parms from *anywhere* in the source tree if you want to initialize
some parameter from the boot line.  for example, consider this snippet
from drivers/mtd/cmdlinepart.c:

==/*
 * This is the handler for our kernel parameter, called from
 * main.c::checksetup(). Note that we can not yet kmalloc() anything,
 * so we only save the commandline for later processing.
 *
 * This function needs to be visible for bootloaders.
 */
static int mtdpart_setup(char *s)
{
        cmdline = s;
        return 1;
}

__setup("mtdparts=", mtdpart_setup);
==
  so, from some MTD code, we've defined a boot-time parm, and we can
even see why from the comment.  but that source file cmdlinepart.c can
be selected to be *modular* as well.  and if it is, it won't even be
*loaded* at boot time, so trying to assign that parameter will simply
fail, right?  it makes sense if that source file is compiled into
the kernel, but not so much if it's modular.  am i understanding all
that correctly?  because there's one more level of silliness in all of
this.

  it looks like there are source files that are trying to have it both
ways, without any compelling reason.  consider the source file
drivers/char/hangcheck-timer.c.  first there are the regular module
parameters:

...
module_param(hangcheck_tick, int, 0);
module_param(hangcheck_margin, int, 0);
module_param(hangcheck_reboot, int, 0);
... etc etc ...

  those parameter names seem really badly chosen since, if you wanted
to manipulate them on the boot line, it would look like:

  ... hangcheck-timer.hangcheck_tick=5

barf.  it would have made far more sense to just call those params
tick, margin and so on, no?  they're not going to clash since they're
defined purely within the context of this module.  but here's where it
gets ugly, since that very same source file *also* uses __setup() to
define even more boot-time params if this file is not being built as a
module:

==#ifndef MODULE

static int __init hangcheck_parse_tick(char *str)
{
        int par;
        if (get_option(&str,&par))
                hangcheck_tick = par;
        return 1;
}
...
__setup("hcheck_tick", hangcheck_parse_tick);
==
  ok, that is just grotesque.  if i read this properly, someone
originally created the module parameter names, then realized that
setting them at boot time would be a real PITA, and so hacked it even
further by creating even *more* parameter names with __setup() to deal
with that.

  am i justifiably nauseated by this?  or is there something clever
happening here that i haven't figured out yet?

rday

p.s.  and regarding my original question, i'm guessing that,
*technically*, there's nothing wrong with using __setup() to define a
parameter named "dssc4.setup", but that seems to violate the spirit of
how you're supposed to use this and, as above, that will fail anyway
if you choose to build dssc4 as a module.

  so ...thoughts?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
