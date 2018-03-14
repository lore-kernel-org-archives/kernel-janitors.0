From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 14 Mar 2018 19:00:16 +0000
Subject: Re: [PATCH][next] perf tests: fix out of bounds access on array fd when cnt is 100
Message-Id: <20180314190016.GF27335@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180314173354.11250-1-colin.king@canonical.com>
In-Reply-To: <20180314173354.11250-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Wed, Mar 14, 2018 at 05:33:54PM +0000, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when cnt is 100 an array bounds overflow occurs on the assignment
> of fd[cnt]. Fix this by performing the bounds check on cnt before writing
> to fd.
> 
> Detected by cppcheck:
> tools/perf/tests/bp_account.c:115: (warning) Either the condition
> 'cnt=100' is redundant or the array 'fd[100]' is accessed at index 100,
> which is out of bounds.
> 
> Fixes: 032db28e5fa3 ("perf tests: Add breakpoint accounting/modify test")

Thanks, applied.

- Arnaldo
