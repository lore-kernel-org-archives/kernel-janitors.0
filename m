From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 06 Aug 2008 10:02:46 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <alpine.LFD.1.10.0808060557160.24753@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 6 Aug 2008, Johannes Weiner wrote:

> > On Tue, Aug 05, 2008 at 10:27:03PM -0400, Robert P. J. Day wrote:
> >> ok ... what is the point of the following?
> >>
> >> #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
> >> fs_initcall(cpufreq_gov_userspace_init);
> >> #else
> >> module_init(cpufreq_gov_userspace_init);
> >> #endif
> >>
> >> and why can't it be reduced?

... snip ...

> Having a verbose ifdef with the config option, I hoped, would
> explain it as in 'initialize the thing early if it is the default
> governor'.
>
> But I agree that a plain fs_initcall() with a comment above it would
> be perhaps less ugly.

  rather than do that, hold off a bit.  i just submitted the following
patch for include/linux/init.h:

 #define postcore_initcall(fn)           module_init(fn)
 #define arch_initcall(fn)               module_init(fn)
 #define subsys_initcall(fn)             module_init(fn)
+#define subsys_initcall_sync(fn)        module_init(fn)
 #define fs_initcall(fn)                 module_init(fn)
 #define device_initcall(fn)             module_init(fn)
 #define late_initcall(fn)               module_init(fn)

  it's an innocuous addition that would allow folks who *truly* need
to control the timing of their init code that precisely to use
subsys_initcall_sync() instead of fs_initcall(), since the use of
fs_initcall() to do that is really kind of hacky.  the use of
subsys_initcall_sync() instead at least makes it more obvious what
you're trying to accomplish, and has exactly the same effect.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
