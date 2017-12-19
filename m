From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 19 Dec 2017 14:38:11 +0000
Subject: Re: [PATCH v2] Adjustments: lock/unlock task in context_switch
Message-Id: <20171219143811.yooqtut2ugwuq5hx@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215140603.gxe5i2y6fg5ojfpp@smtp.gmail.com>
 <20171218193002.zzuocnd2hyt34ok5@hirez.programming.kicks-ass.net>
 <20171219142357.cfmdyfyhay4hsxrb@smtp.gmail.com>
In-Reply-To: <20171219142357.cfmdyfyhay4hsxrb@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 19, 2017 at 12:23:57PM -0200, Rodrigo Siqueira wrote:
> In the original patch, I called this function as release_lock_task,
> because the release_task was already declared as extern in
> include/linux/sched/task.h. I believe there is a function name conflict
> here, is that correct?

Bah, you're right. Clearly I didn't compile test yet.. I'll fix it up.

Thanks.
