From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 06 Aug 2008 02:07:47 +0000
Subject: getting rid of "fs_initcall" from drivers/ code
Message-Id: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i noticed that there are a number of drivers that, rather than use
the standard module_init() call, use fs_initcall() instead, ostensibly
because the author wants to very carefully control when that code is
run if the code is compiled into the kernel.  but it seems that a lot
of that can be cleaned up, if i'm reading my init code correctly.

  by way of explanation, here's the order of (a partial list of)
initcalls from include/linux/init.h:

...
#define subsys_initcall(fn)             __define_initcall("4",fn,4)
#define subsys_initcall_sync(fn)        __define_initcall("4s",fn,4s)
#define fs_initcall(fn)                 __define_initcall("5",fn,5)
#define fs_initcall_sync(fn)            __define_initcall("5s",fn,5s)
#define rootfs_initcall(fn)             __define_initcall("rootfs",fn,rootfs)
#define device_initcall(fn)             __define_initcall("6",fn,6)
#define device_initcall_sync(fn)        __define_initcall("6s",fn,6s)
...

  so, when code is compiled into the kernel, the initcalls will be
done in the order of subsys, then fs, then rootfs, then device, etc,
etc.  fair enough.  so what does this have to do with modules and
module_init()?

  if i'm reading this correctly, if you have code that contains a call
to module_init() and that code is selected to be compiled into the
kernel,  this is what kicks in from include/linux/init.h:

...
#ifndef MODULE
...
#define __initcall(fn) device_initcall(fn)
...
#define module_init(x)  __initcall(x);
...

  in short, a call to module_init() will be transformed into a call to
device_initcall(), which would seem to be perfectly reasonable since
that seems like where it should be executed in the sequence of
initcalls at boot time.  however, in some cases, the author seems to
feel that his code must run *precisely* after the subsys calls, but
*before* any device calls, and that's why you find stuff like this in
drivers/pcmcia/ds.c:

...
fs_initcall(init_pcmcia_bus); /* one level after subsys_initcall so that
                               * pcmcia_socket_class is already registered */
...

  it's clearly a hacky way of inserting something between the end of
the subsys initcalls, and the beginning of the device initcalls.  If
the code is compiled into the kernel, then that code is executed at
that point.  if, however, the code is made modular, what happens to
the invocation of fs_initcall()?  simple -- from include/linux/init.h
again:

...
#else /* MODULE */

/* Don't use these in modules, but some people do... */
#define core_initcall(fn)               module_init(fn)
#define postcore_initcall(fn)           module_init(fn)
#define arch_initcall(fn)               module_init(fn)
#define subsys_initcall(fn)             module_init(fn)
#define fs_initcall(fn)                 module_init(fn)
#define device_initcall(fn)             module_init(fn)
#define late_initcall(fn)               module_init(fn)

#define security_initcall(fn)           module_init(fn)
...

  so, if the code is selected to be modular, *all* of those (hacky?)
initcall settings (including fs_initcall, of course) will simply be
transformed to calls to module_init(), and everything will work
normally.  so what's to clean up here?

  first, it's worth asking if there is even a legitimate reason for
code writers to *ensure* that their code runs specifically after the
subsys calls and before the device calls.  some of those writers seem
to think so but, if that *has* to happen, then it would make more
sense to invoke subsys_initcall_sync() rather than fs_initcall().
using fs_initcall() for this purpose is just ugly and, semantically,
using subsys_initcall_sync() makes far more sense.  this would involve
adding the extra line:

#define subsys_initcall_sync(fn)         module_init(fn)

to the above list, but i still think it would be a better solution.
(and, again, this still requires these code writers to demonstrate
that they need that kind of fine-grained resolution in controlling
when their code runs.)

  in other cases, it seems that the cleanup is more straightforward.
consider this from drivers/cpufreq/cpufreq_userspace.c:

#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
fs_initcall(cpufreq_gov_userspace_init);
#else
module_init(cpufreq_gov_userspace_init);
#endif

  ok, that's just grotesque as it's redundant since it can all be
replaced with a simple:

fs_initcall(cpufreq_gov_userspace_init);

and everything will work just fine based on what i wrote above, no?

  in short, it seems a lot of that nonsense can be cleaned.  thoughts?

rday

p.s.  and even if that code from cpufreq_userspace.c *needs* to have
that kind of control on when it has to run, again, using
subsys_initcall_sync() instead of fs_initcall() still makes more
sense.
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
