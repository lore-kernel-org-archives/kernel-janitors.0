From: Marc Zyngier <maz@kernel.org>
Date: Wed, 23 Oct 2019 16:51:14 +0000
Subject: Re: [PATCH] KVM: arm64: Select =?UTF-8?Q?SCHED=5FINFO=20before=20?=  =?UTF-8?Q?SCHEDSTATS?=
Message-Id: <26ee413334937b9530bc8f033fe378ec@www.loen.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023032254.159510-1-maowenan@huawei.com>
In-Reply-To: <20191023032254.159510-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, steven.price@arm.com
Cc: catalin.marinas@arm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, will@kernel.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org

On 2019-10-23 04:22, Mao Wenan wrote:
> If KVM=y, it will select SCHEDSTATS, below erros can
> be seen:
> kernel/sched/stats.h: In function rq_sched_info_arrive:
> kernel/sched/stats.h:12:20: error: struct sched_info
> has no member named run_delay
>    rq->rq_sched_info.run_delay += delta;
>                     ^
> kernel/sched/stats.h:13:20: error: struct sched_info
> has no member named pcount
>    rq->rq_sched_info.pcount++;
>                     ^
> kernel/sched/stats.h: In function rq_sched_info_dequeued:
> kernel/sched/stats.h:31:20: error: struct sched_info has
> no member named run_delay
>    rq->rq_sched_info.run_delay += delta;
>
> These are because CONFIG_SCHED_INFO is not set, This patch
> is to select SCHED_INFO before SCHEDSTATS.
>
> Fixes: 8564d6372a7d ("KVM: arm64: Support stolen time reporting via
> shared structure")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  arch/arm64/kvm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index d8b88e4..3c46eac 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -39,6 +39,7 @@ config KVM
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
>  	select HAVE_KVM_VCPU_RUN_PID_CHANGE
> +	select SCHED_INFO
>  	select SCHEDSTATS
>  	---help---
>  	  Support hosting virtualized guest machines.

SCHEDSTATS is really an odd choice. Here's what I get after disabling
DEBUG_KERNEL (from defconfig):

WARNING: unmet direct dependencies detected for SCHEDSTATS
   Depends on [n]: DEBUG_KERNEL [=n] && PROC_FS [=y]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && OF [=y]

WARNING: unmet direct dependencies detected for SCHEDSTATS
   Depends on [n]: DEBUG_KERNEL [=n] && PROC_FS [=y]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && OF [=y]

WARNING: unmet direct dependencies detected for SCHEDSTATS
   Depends on [n]: DEBUG_KERNEL [=n] && PROC_FS [=y]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && OF [=y]

So clearly SCHEDSTATS isn't meant to be selected on its own.

We can either just select SCHED_INFO (which *nobody else does*), or go
the full x86 way which selects TASK_DELAY_ACCT (and thus depends on
NET && MULTIUSER). My gut feeling is that we shouldn't deviate too much
from x86...

Thoughts?

         M.
-- 
Jazz is not dead. It just smells funny...
