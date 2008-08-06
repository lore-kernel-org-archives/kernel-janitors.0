From: Johannes Weiner <hannes@saeurebad.de>
Date: Wed, 06 Aug 2008 07:30:33 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <8763qe4n3a.fsf@saeurebad.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Matthew Wilcox <matthew@wil.cx> writes:

> On Tue, Aug 05, 2008 at 10:27:03PM -0400, Robert P. J. Day wrote:
>> ok ... what is the point of the following?
>> 
>> #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
>> fs_initcall(cpufreq_gov_userspace_init);
>> #else
>> module_init(cpufreq_gov_userspace_init);
>> #endif
>> 
>> and why can't it be reduced?
>
> That's a silly author. 

Sorry, my fault.

> The correct patch would look something like this:
>
> -#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
>  fs_initcall(cpufreq_gov_userspace_init);
> -#else
> -module_init(cpufreq_gov_userspace_init);
> -#endif
>
> I couldn't tell you why this needs to be an fs_initcall rather than a
> plain module_init() (aka device_initcall()).  IMO every use of
> fs_initcall() in a module needs to document what ordering problem it's
> solving.

The cpu-specific driver used to call into the default governor before it
was initialized.

See 6915719b36a97d28fab576c6fa2a20364b435fe6.

Having a verbose ifdef with the config option, I hoped, would explain it
as in 'initialize the thing early if it is the default governor'.

But I agree that a plain fs_initcall() with a comment above it would be
perhaps less ugly.

	Hannes
