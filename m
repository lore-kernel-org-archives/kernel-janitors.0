From: "Tharindu Rukshan Bamunuarachchi" <tharindunix@gmail.com>
Date: Wed, 16 Aug 2006 12:32:20 +0000
Subject: Re: [KJ] timeslice calculation
Message-Id: <c49434130608160520n341bf2cbg9cc6b7e768ea1f0e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c49434130608150411i1a1c3597h18f3d7dfa1e093ff@mail.gmail.com>
In-Reply-To: <c49434130608150411i1a1c3597h18f3d7dfa1e093ff@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dear All,

They have changed HZ value. So, they says my timer interrupt occures
at 1ms interval. IS it true??

Anyway, is it impossible to calculate HZ value in running linux system.

Because, we wanted to have highly interactive system. So they have
suggested change of timer interval fire. What about decrease of
minimum time slice.

Looking forward for your comments.

Tharindu

On 8/16/06, Andreas Mohr <andi@rhlx01.fht-esslingen.de> wrote:
> Hi,
>
> On Tue, Aug 15, 2006 at 12:00:25PM -0700, kernel-janitors-request@lists.osdl.org wrote:
> > Message: 11
> > Date: Tue, 15 Aug 2006 16:41:28 +0530
> > From: "Tharindu Rukshan Bamunuarachchi" <tharindunix@gmail.com>
> > Subject: [KJ] timeslice calculation
> > To: Kernel-janitors@lists.osdl.org
> > Message-ID:
> >       <c49434130608150411i1a1c3597h18f3d7dfa1e093ff@mail.gmail.com>
> > Content-Type: text/plain; charset=ISO-8859-1; format=flowed
> >
> > Are there anyway to get timeslice of currenlty running process. Or are
> > there anyway to calculate timeslice ??
>
> I cannot tell you of any method off-hand, but there could be one.
>
> > Because, our system hosting firm said they have recomplied kernel with
> > setting default timeslice to 1ms. IS this possible?? If so how can I
> > calculate this from user space program ??
> >
> > In linux kernel source, is it possible to change default timelice ??
> > and timer fire period ??
>
> See *TIMESLICE defines at the top of linux/kernel/sched.c
> Timer tick rate is the CONFIG_HZ setting, usually at HZ0
> (100 timer ticks per second), as used for servers, but other common
> values are 250 (moderately bad for desktop and not good for servers,
> IOW somewhat useless ;-) and 1000 (desktop). So they most likely just set
> CONFIG_HZ00.
>
> If you want quite different (much better? ;-) scheduling behaviour,
> then you may have luck with Con Kolivas kernels (e.g. 2.6.17-ck1).
>
> --
> No programming skills!? Why not help translate many Linux applications!
> https://launchpad.ubuntu.com/rosetta
> (or alternatively buy nicely packaged Linux distros/OSS software to help
> support Linux developers creating shiny new things for you?)
>


-- 
Tharindu Rukshan Bamunuarachchi
all fabrications are subject to decay
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
