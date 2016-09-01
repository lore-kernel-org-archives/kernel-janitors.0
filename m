From: Jeehong Kim <jhez.kim@samsung.com>
Date: Thu, 01 Sep 2016 11:52:11 +0000
Subject: Re: [PATCH V2] sched/fair: Fix that tasks are not constrained by cfs_b->quota on hotplug core, when 
Message-Id: <57C8166B.3080807@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472562760-20842-1-git-send-email-jhez.kim@samsung.com>
 <CGME20160901110137epcas1p43613cbf901ffea109cc82f10ebd251db@epcas1p4.samsung.com>
 <20160901110132.GG10138@twins.programming.kicks-ass.net>
In-Reply-To: <20160901110132.GG10138@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ezjjilong@gmail.com, Ben Segall <bsegall@google.com>

Hello,

First of all, thanks for review. And I am sorry that I forgot to CC Ben.

The reason why I sent last mail twice is that I forgot including the comments for changes from PATCH V1.

Thanks and BR.

On 2016년 09월 01일 20:01, Peter Zijlstra wrote:
> You forgot to Cc Ben, who gave you feedback on v1, which is rather poor
> style. Also, I don't see how kernel-janitors is relevant to this patch.
> This is very much not a janitorial thing.
>
> (also, why send it twice?)
>
> On Tue, Aug 30, 2016 at 10:12:40PM +0900, Jeehong Kim wrote:
>> In case that CONFIG_HOTPLUG_CPU and CONFIG_CFS_BANDWIDTH is turned on
>> and tasks in bandwidth controlled task group run on hotplug core,
>> the tasks are not controlled by cfs_b->quota when hotplug core is offline
>> and then online. The remaining tasks in task group consume all of
>> cfs_b->quota on other cores.
>>
>> The cause of this problem is described as below:
>>
>> 1. When hotplug core is offline while tasks in task group run
>> on hotplug core, unregister_fair_sched_group() deletes
>> leaf_cfs_rq_list of tg->cfs_rq[cpu] from &rq_of(cfs_rq)->leaf_cfs_rq_list.
>>
>> 2. Then, when hotplug core is online, update_runtime_enabled()
>> registers cfs_b->quota on cfs_rq->runtime_enabled of all leaf cfs_rq
>> on runqueue. However, because this is before enqueue_entity() adds
>> &cfs_rq->leaf_cfs_rq_list on &rq_of(cfs_rq)->leaf_cfs_rq_list,
>> cfs->quota is not register on cfs_rq->runtime_enabled.
>>
>> To resolve this problem, this patch makes update_runtime_enabled()
>> registers cfs_b->quota by using walk_tg_tree_from().
>
>> +static int __maybe_unused __update_runtime_enabled(struct task_group *tg, void *data)
>>  {
>> +	struct rq *rq = data;
>> +	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
>> +	struct cfs_bandwidth *cfs_b = &cfs_rq->tg->cfs_bandwidth;
>>
>> +	raw_spin_lock(&cfs_b->lock);
>> +	cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
>> +	raw_spin_unlock(&cfs_b->lock);
>>
>> +	return 0;
>> +}
>> +
>> +static void __maybe_unused update_runtime_enabled(struct rq *rq)
>> +{
>> +	struct cfs_rq *cfs_rq = &rq->cfs;
>> +
>> +	/* register cfs_b->quota on the whole tg tree */
>> +	rcu_read_lock();
>> +	walk_tg_tree_from(cfs_rq->tg, __update_runtime_enabled, tg_nop, (void *)rq);
>> +	rcu_read_unlock();
>>  }
> Looks ok, performance on hotplug doesn't really matter. Ben, you happy
> with this?
>
>
>

