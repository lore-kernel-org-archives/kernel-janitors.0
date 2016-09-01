From: bsegall@google.com
Date: Thu, 01 Sep 2016 17:23:22 +0000
Subject: Re: [PATCH V2] sched/fair: Fix that tasks are not constrained by cfs_b->quota on hotplug core, when 
Message-Id: <xm26bn07fsad.fsf@bsegall-linux.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472562760-20842-1-git-send-email-jhez.kim@samsung.com>
        <20160901110132.GG10138@twins.programming.kicks-ass.net>
In-Reply-To: <20160901110132.GG10138@twins.programming.kicks-ass.net> (Peter
        Zijlstra's message of "Thu, 1 Sep 2016 13:01:32 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jeehong Kim <jhez.kim@samsung.com>, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ezjjilong@gmail.com

Peter Zijlstra <peterz@infradead.org> writes:

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
>
> Looks ok, performance on hotplug doesn't really matter. Ben, you happy
> with this?

I'm not 100% sure about the exact timings and mechanics of hotplug, but
cfs-bandwidth wise this is ok. We may still have runtime_remaining = 1,
or we may have < 0 and yet be unthrottled, but either case is ok, even
if hotplug allows tasks to have migrated here already (I'm not sure,
looking at the code).

Now that I check again you can just loop over the list of tgs rather
than the hierarchical walk_tg_tree_from, but there's certainly no harm
in it.
