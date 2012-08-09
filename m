From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Thu, 09 Aug 2012 09:28:59 +0000
Subject: Re: [pm:linux-next 9/38] kernel/time/timekeeping.c:736:2: error: implicit declaration of function 'c
Message-Id: <201208091128.59510.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120808235122.GA27951@localhost>
In-Reply-To: <20120808235122.GA27951@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thursday, August 09, 2012, Fengguang Wu wrote:
> Hi Rafael,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> head:   9ea3f7070730c4148694904a335825f7e4540604
> commit: a2c2042496a64a555ae383a90bc0ab17f37e92f4 [9/38] timekeeping: Add suspend and resume of clock event devices
> config: cris-etrax-100lx_v2_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/time/timekeeping.c: In function 'timekeeping_resume':
> kernel/time/timekeeping.c:736:2: error: implicit declaration of function 'clockevents_resume' [-Werror=implicit-function-declaration]
> kernel/time/timekeeping.c: In function 'timekeeping_suspend':
> kernel/time/timekeeping.c:795:2: error: implicit declaration of function 'clockevents_suspend' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 
> vim +736 kernel/time/timekeeping.c
>    733	
>    734		read_persistent_clock(&ts);
>    735	
>  > 736		clockevents_resume();
>    737		clocksource_resume();
>    738	
>    739		write_seqlock_irqsave(&timekeeper.lock, flags);
> 

That most likely is due to CONFIG_GENERIC_CLOCKEVENTS_BUILD unset.  Should be
fixed now.

Thanks,
Rafael
