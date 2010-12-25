From: Paul Menage <menage@google.com>
Date: Sat, 25 Dec 2010 20:59:07 +0000
Subject: Re: [PATCH] sched, cgroup: Use exit hook to avoid use-after-free crash
Message-Id: <AANLkTikTaYjm_xfzZkYO63Wovf9frjPAsuzwPXBtB-Tm@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
 <1277808215.1868.5.camel@laptop> <20101219020313.GJ31750@genesis.frugalware.org>
 <20101222002248.GP10557@genesis.frugalware.org> <1293006589.2170.41.camel@laptop>
 <1293007311.11370.172.camel@marge.simson.net> <1293008842.2170.70.camel@laptop>
 <20101222133154.GS10557@genesis.frugalware.org> <1293026422.2170.136.camel@laptop>
 <1293027112.2170.140.camel@laptop> <20101222151434.GW10557@genesis.frugalware.org>
 <1293037718.2170.155.camel@laptop> <1293050173.2170.389.camel@laptop>
 <AANLkTi=1GMKF4emms0Qpx31=xk-FZXOTaeONmCohzWb2@mail.gmail.com>
 <1293106330.2170.618.camel@laptop> <1293107624.2170.642.camel@laptop>
 <1293128670.2170.748.camel@laptop> <1293132304.6798.6.camel@marge.simson.net>
 <1293132862.25981.22.camel@laptop> <1293187425.7138.2.camel@marge.simson.net>
 <1293188091.25981.200.camel@laptop> <1293192999.18035.4.camel@marge.simson.net>
 <1293206353.29444.205.camel@laptop>
In-Reply-To: <1293206353.29444.205.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mike Galbraith <efault@gmx.de>, Miklos Vajna <vmiklos@frugalware.org>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>, Paul Turner <pjt@google.com>, Yong Zhang <yong.zhang0@gmail.com>, Li Zefan <lizf@cn.fujitsu.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, Srivatsa Vaddagiri <vatsa@in.ibm.com>

On Fri, Dec 24, 2010 at 3:59 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> Subject: sched, cgroup: Use exit hook to avoid use-after-free crash
>
> By not notifying the controller of the on-exit move back to
> init_css_set, we fail to move the task out of the previous cgroup's
> cfs_rq. This leads to an opportunity for a cgroup-destroy to come in and
> free the cgroup (there are no active tasks left in it after all) to
> which the not-quite dead task is still enqueued.

While this patch is likely fine for solving the problem, it does add
extra work into the task exit path.

Could you instead just use the pre_destroy callback to return -EBUSY
if there are still any tasks on the cfs_rq? That way there'd only be a
penalty on cgroup destruction, which is a much rarer operation.

Paul
