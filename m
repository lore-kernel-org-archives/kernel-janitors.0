From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 29 Oct 2018 12:35:02 +0000
Subject: Re: [PATCH] drivers/perf: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181029123502.GA57235@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026175839.4565-1-colin.king@canonical.com>
 <20181029122854.GB20813@kernel.org>
In-Reply-To: <20181029122854.GB20813@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Colin King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Em Fri, Oct 26, 2018 at 06:58:39PM +0100, Colin King escreveu:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Trivial fix to a spelling mistake of the error access name EACCESS,
> > rename to EACCES
> 
> Thanks, applied.
> 
> And I also took the chance to fix another spelling mistake, on this same
> line:
> 
> -        *  -EACCESS    -- @event is for this PMU, @event is valid, but no privilidges
> +        *  -EACCES     -- @event is for this PMU, @event is valid, but no privilidges
>                                                                                  ^
>                                                                                  ^
>                                                                                  ^
>                                                                                  ^
> 
> :-)

LOL.

I zapped my commit from perf/urgent, because I failed to notice the 
second typo :-)

Thanks,

	Ingo
