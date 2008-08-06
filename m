From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 06 Aug 2008 02:51:53 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <alpine.LFD.1.10.0808052248330.22252@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 5 Aug 2008, Matthew Wilcox wrote:

> On Tue, Aug 05, 2008 at 10:27:03PM -0400, Robert P. J. Day wrote:
> > ok ... what is the point of the following?
> >
> > #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
> > fs_initcall(cpufreq_gov_userspace_init);
> > #else
> > module_init(cpufreq_gov_userspace_init);
> > #endif
> >
> > and why can't it be reduced?
>
> That's a silly author.  The correct patch would look something like
> this:
>
> -#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
>  fs_initcall(cpufreq_gov_userspace_init);
> -#else
> -module_init(cpufreq_gov_userspace_init);
> -#endif

ah ... so after being condescending and snotty to me in your previous
posting here when i suggested that some cleanup could be done, you've
responded to my followup post and admitted that ... some cleanup could
be done.

you might have gone with that right off the bat and not come off as
such a total douchebag, matthew.  it would have saved us all a bit of
time.  know what i'm sayin'?

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
