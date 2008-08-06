From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 06 Aug 2008 02:27:03 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <alpine.LFD.1.10.0808052226070.21069@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 5 Aug 2008, Matthew Wilcox wrote:

> On Tue, Aug 05, 2008 at 10:07:47PM -0400, Robert P. J. Day wrote:
> >   in short, it seems a lot of that nonsense can be cleaned.  thoughts?
>
> You're wrong.  And far too verbose to explain why.  Ask a simple
> question, in no more than 5 lines of 80-column text, and I will answer
> it more politely.

ok ... what is the point of the following?

#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
fs_initcall(cpufreq_gov_userspace_init);
#else
module_init(cpufreq_gov_userspace_init);
#endif

and why can't it be reduced?

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
