From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 05:21:37 +0000
Subject: Re: [time:fortglx/3.6/time 12/14] kernel/time/timekeeping.c:374:7: warning: unused variable 'arch_of
Message-Id: <20120713052137.GA16044@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120713050728.GA15846@localhost>
In-Reply-To: <20120713050728.GA15846@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 12, 2012 at 10:16:48PM -0700, John Stultz wrote:
> On 07/12/2012 10:07 PM, Fengguang Wu wrote:
> >Hi John,
> >
> >There are new compile warnings show up in
> >
> >tree:   git://git.linaro.org/people/jstultz/linux.git fortglx/3.6/time
> >head:   a752ef2bd4724278f5bba89707f3dc7506657d27
> >commit: 895abac0b725ee38b746dfd548fcb30375819747 [12/14] time: Move arch_gettimeoffset() usage into timekeeping_get_ns()
> >
> >All warnings:
> >
> >kernel/time/timekeeping.c: In function 'getnstime_raw_and_real':
> >kernel/time/timekeeping.c:374:7: warning: unused variable 'arch_offset' [-Wunused-variable]
> >
> 
> Cool! I was just about to send that set out. Will update and fix
> this before I do!
> 
> Thanks so much!

I'm glad to know it helped. You are welcome :)

Thanks,
Fengguang
