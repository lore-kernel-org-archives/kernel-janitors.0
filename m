From: Mike Galbraith <efault@gmx.de>
Date: Tue, 02 Oct 2012 03:48:09 +0000
Subject: Re: warning: (SCHED_AUTOGROUP) selects CGROUP_SCHED which has unmet direct dependencies (CGROUPS &&
Message-Id: <1349149689.7086.33.camel@marge.simpson.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002025502.GA9385@localhost>
In-Reply-To: <20121002025502.GA9385@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-10-02 at 10:55 +0800, Fengguang Wu wrote: 
> Hi Mike,
> 
> FYI, there are new compile warnings show up in
> 
> commit: 5091faa449ee0b7d73bc296a93bca9540fc51d0a  sched: Add 'autogroup' scheduling feature: automated per session task groups
> config: x86_64-randconfig-h011 (attached as .config)

Yeah, SCHED_AUTOGROUP should have also depended upon EXPERIMENTAL.

CGROUP_SCHED lost the EXPERIMENTAL dependency in 3.3.  I don't think
this would qualify for a -stable backport, so there's not much I can do
about it now.

> 
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -728,6 +728,19 @@ config NET_NS
>  
>  endif # NAMESPACES
>  
> +config SCHED_AUTOGROUP
> +       bool "Automatic process group scheduling"
> +       select EVENTFD
> +       select CGROUPS
> +       select CGROUP_SCHED
> +       select FAIR_GROUP_SCHED
> +       help
> +         This option optimizes the scheduler for common desktop workloads by
> +         automatically creating and populating task groups.  This separation
> +         of workloads isolates aggressive CPU burners (like build jobs) from
> +         desktop applications.  Task group autogeneration is currently based
> +         upon task session.
> +
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation


