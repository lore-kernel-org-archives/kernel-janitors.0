From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 13 May 2019 07:55:35 +0000
Subject: Re: [PATCH] sched: remove redundant assignment to variable utime
Message-Id: <20190513075535.GI2623@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511131849.4513-1-colin.king@canonical.com>
In-Reply-To: <20190511131849.4513-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 11, 2019 at 02:18:49PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable utime is being assigned a value however this is never
> read and later it is being reassigned to a new value. The assignment
> is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Argh. not again.. still no.
