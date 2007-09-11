From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 11 Sep 2007 23:44:06 +0000
Subject: Re: does '__setup("dscc4.setup=", dscc4_setup);' make any sense?
Message-Id: <Pine.LNX.4.64.0709111926300.4198@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709111538230.25770@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 11 Sep 2007, Randy Dunlap wrote:

> On Tue, 11 Sep 2007 17:21:53 -0400 (EDT) Robert P. J. Day wrote:
>
> > On Tue, 11 Sep 2007, Randy Dunlap wrote:
> >
> > > On Tue, 11 Sep 2007 15:41:02 -0400 (EDT) Robert P. J. Day wrote:
> > ...
> > > > __setup("dscc4.setup=", dscc4_setup);
> >
> > > You are correct AFAIK.  Please check with the driver maintainer:
>
> Nope, I be wrong.  I jumped too quickly, thinking this was a
> module_param() instead of a __setup()...  Sorry about that.

i noticed that as well.  so there's nothing *technically* wrong with
defining a boot-time parm with __setup() that just happens to match
"module.param" syntax but, holy crap, it's confusing.  :-P

> I think that the early_param() serves a clear purpose, but __setup()
> being used in drivers is mostly historical.

even early_param() has limited usefulness in drivers given that those
params really are processed early in the startup sequence, long before
any modules would be loaded.  in fact, there's not a lot of that in
the drivers/ directory:

$ grep -rw early_param drivers
drivers/acpi/tables.c:early_param("acpi_apic_instance", acpi_parse_apic_instance);
drivers/serial/8250_early.c:early_param("earlycon", setup_early_serial8250_console);
drivers/pci/pci.c:early_param("pci", pci_setup);
$

which is about what i would have expected.  there's a *lot* more
__setup() stuff in drivers:

$ grep -rw __setup drivers | wc -l
139

but i'm guessing that a lot of that would look better as actual module
parameters.  you can see the historical cruft left over in the
kernel-parameters.txt file, such as:

   blkmtd_device=  [HW,MTD]
   blkmtd_erasesz   blkmtd_ro   blkmtd_bs   blkmtd_count
sort of suggests that, once upon a time, there was a blkmtd module.
:-)

> I'd prefer to see drivers just use module_param() now, but it is
> relatively new, so lots of drivers were written before it existed.

clearly.

...
> >   so, from some MTD code, we've defined a boot-time parm, and we
> > can even see why from the comment.  but that source file
> > cmdlinepart.c can be selected to be *modular* as well.  and if it
> > is, it won't even be *loaded* at boot time, so trying to assign
> > that parameter will simply fail, right?  it makes sense if that
> > source file is compiled into
>
> fail silently IIRC.  Putting "foobar=blah" on the kernel command line
> is just noise unless it is recognized.

the relevant code is in kernel/params.c:
        ...
        if (handle_unknown) {
                DEBUGP("Unknown argument: calling %p\n", handle_unknown);
                return handle_unknown(param, val);
        }

        DEBUGP("Unknown argument `%s'\n", param);
        return -ENOENT;
        ...

and DEBUGP is currently hard-coded into nothingness in that file so,
yes, it would be silent.  (would it be such a bad idea to make that
debugging user-configurable?  would it ever be handy to see those
messages?)

> >   it looks like there are source files that are trying to have it both
> > ways, without any compelling reason.  consider the source file
> > drivers/char/hangcheck-timer.c.  first there are the regular module
> > parameters:
> >
> > ...
> > module_param(hangcheck_tick, int, 0);
> > module_param(hangcheck_margin, int, 0);
> > module_param(hangcheck_reboot, int, 0);
> > ... etc etc ...
> >
> >   those parameter names seem really badly chosen since, if you wanted
> > to manipulate them on the boot line, it would look like:
> >
> >   ... hangcheck-timer.hangcheck_tick=5
>
> Yeah, but that's a different subject.

true, but i think it's safe to say that there's no compelling reason
to *ever* have created module parameters with the module name as a
prefix.  that seems wholly redundant.  yes, there's a lot of that
old-style parm definition that would look nicer using the newer
technique.

anyway, back to the grind.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
