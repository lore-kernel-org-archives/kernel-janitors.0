From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 10 Nov 2020 16:54:01 +0000
Subject: Re: [PATCH][next] sched/debug: fix memory corruption caused by multiple small reads of flags
Message-Id: <20201110165401.GN2594@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029151103.373410-1-colin.king@canonical.com>
In-Reply-To: <20201029151103.373410-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <valentin.schneider@arm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 29, 2020 at 03:11:03PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Reading /proc/sys/kernel/sched_domain/cpu*/domain0/flags mutliple times
> with small reads causes oopses with slub corruption issues because the kfree is
> free'ing an offset from a previous allocation. Fix this by adding in a new
> pointer 'buf' for the allocation and kfree and use the temporary pointer tmp
> to handle memory copies of the buf offsets.

Thanks!
