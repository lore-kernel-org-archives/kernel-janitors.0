From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 06 Aug 2008 02:47:43 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <20080806024743.GE2055@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 05, 2008 at 10:27:03PM -0400, Robert P. J. Day wrote:
> ok ... what is the point of the following?
> 
> #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
> fs_initcall(cpufreq_gov_userspace_init);
> #else
> module_init(cpufreq_gov_userspace_init);
> #endif
> 
> and why can't it be reduced?

That's a silly author.  The correct patch would look something like
this:

-#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
 fs_initcall(cpufreq_gov_userspace_init);
-#else
-module_init(cpufreq_gov_userspace_init);
-#endif

I couldn't tell you why this needs to be an fs_initcall rather than a
plain module_init() (aka device_initcall()).  IMO every use of
fs_initcall() in a module needs to document what ordering problem it's
solving.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
