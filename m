From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 29 Oct 2018 12:33:57 +0000
Subject: Re: [PATCH] drivers/perf: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181029123357.GA21857@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026175839.4565-1-colin.king@canonical.com>
 <20181029122854.GB20813@kernel.org>
In-Reply-To: <20181029122854.GB20813@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Mon, Oct 29, 2018 at 09:28:54AM -0300, Arnaldo Carvalho de Melo escreveu:
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

But I see Ingo has already merged your patch, lets fix that one later
then :-)

- Arnaldo
