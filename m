From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 04 Nov 2019 10:14:26 +0000
Subject: Re: [PATCH] locking/lockdep: update the comment for __lock_release()
Message-Id: <20191104101426.GD4131@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104091252.GA31509@mwanda>
In-Reply-To: <20191104091252.GA31509@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 04, 2019 at 12:12:52PM +0300, Dan Carpenter wrote:
> This changes "to the list" to "from the list" and also deletes the
> obsolete comment about the "@nested" argument.  The "nested" argument
> was removed in commit 5facae4f3549 ("locking/lockdep: Remove unused
> @nested argument from lock_release()").
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!
