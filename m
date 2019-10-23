From: Steven Price <steven.price@arm.com>
Date: Wed, 23 Oct 2019 12:32:10 +0000
Subject: Re: [PATCH] KVM: arm64: Select SCHED_INFO before SCHEDSTATS
Message-Id: <20191023123210.GA40238@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023032254.159510-1-maowenan@huawei.com>
In-Reply-To: <20191023032254.159510-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: "maz@kernel.org" <maz@kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>

On Wed, Oct 23, 2019 at 04:22:54AM +0100, Mao Wenan wrote:
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

It looks like I didn't spot this because when DEBUG_KERNEL is enabled
then KVM selects SCHEDSTATS, which selects SCHED_INFO. Thanks for
spotting this.

> 
> Fixes: 8564d6372a7d ("KVM: arm64: Support stolen time reporting via shared structure")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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
> -- 
> 2.7.4
> 
