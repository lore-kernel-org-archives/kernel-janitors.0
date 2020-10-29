From: Valentin Schneider <valentin.schneider@arm.com>
Date: Thu, 29 Oct 2020 15:42:58 +0000
Subject: Re: [PATCH][next] sched/debug: fix memory corruption caused by multiple small reads of flags
Message-Id: <jhjeelhox6l.mognet@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029151103.373410-1-colin.king@canonical.com> <jhjft5xoxtd.mognet@arm.com>
In-Reply-To: <jhjft5xoxtd.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 29/10/20 15:29, Valentin Schneider wrote:
>> @@ -269,17 +269,17 @@ static int sd_ctl_doflags(struct ctl_table *table, int write,
>>               return 0;
>>       }
>>
>> -	tmp = kcalloc(data_size + 1, sizeof(*tmp), GFP_KERNEL);
> [...]
>> -	tmp += *ppos;
> [...]
>> -	kfree(tmp);
>
> Yeah, that's downright sloppy :( I can't remember which one it was in a
> hurry, but I was "inspired" by another proc handler somewhere; I'll try to
> find out if there's any issue in that one or if I really cannot shift the
> blame elsewhere.

Nope, blame is all mine.
