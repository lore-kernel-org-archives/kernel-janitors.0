From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 23 Dec 2019 16:07:50 +0000
Subject: Re: [PATCH] sched: Use kmem_cache_zalloc() instead of kmem_cache_alloc() with flag GFP_ZERO.
Message-Id: <e880ee66-2d7f-be97-5600-a8a459a39feb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577065949-25631-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1577065949-25631-1-git-send-email-wang.yi59@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yi Wang <wang.yi59@zte.com.cn>, Huang Zijiang <huang.zijiang@zte.com.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Ben Segall <bsegall@google.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, up2wing@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, Wang Liang <wang.liang82@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>

…
> +++ b/kernel/sched/core.c
> @@ -6939,7 +6939,7 @@ struct task_group *sched_create_group(struct task_group *parent)
…
> -    tg = kmem_cache_alloc(task_group_cache, GFP_KERNEL | __GFP_ZERO);
> +tg = kmem_cache_zalloc(task_group_cache, GFP_KERNEL);
>      if (!tg)
…

Please fix the indentation.

Would you like to apply a script for the semantic patch language
like the following?

@replacement@
expression gfp, x;
@@
 x =
(
-    kmalloc
+    kzalloc
|
-    kmem_cache_alloc
+    kmem_cache_zalloc
)
            (...,
             gfp
-            | __GFP_ZERO
            )


Regards,
Markus
