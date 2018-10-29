From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 29 Oct 2018 14:19:09 +0000
Subject: Re: [PATCH] drivers/perf: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181029141909.GB104261@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026175839.4565-1-colin.king@canonical.com>
 <20181029122854.GB20813@kernel.org>
 <20181029123357.GA21857@kernel.org>
 <20181029123656.GB57235@gmail.com>
 <20181029132001.GD21857@kernel.org>
In-Reply-To: <20181029132001.GD21857@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Colin King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Ok, I'll put together a perf/urgent with those things resolved, may take
> a day or two as I'm working on addressing DaveM's reported issues and in
> fixing the regressions that that "remove fallback to kallsyms for
> userspace addresses" patch caused.

Sure thing, no rush!

Thanks,

	Ingo
