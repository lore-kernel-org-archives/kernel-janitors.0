From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Wed, 18 Sep 2019 23:09:47 +0000
Subject: Re: [PATCH] perf test: fix spelling mistake "allos" -> "allocate"
Message-Id: <20190918230947.GD32051@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911152148.17031-1-colin.king@canonical.com>
 <2b525705-317a-29a7-9fda-ca7896c8c038@codeaurora.org>
In-Reply-To: <2b525705-317a-29a7-9fda-ca7896c8c038@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Colin King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Tue, Sep 17, 2019 at 01:12:46PM +0530, Mukesh Ojha escreveu:
> 
> On 9/11/2019 8:51 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a TEST_ASSERT_VAL message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Thanks, applied.
 
> Thanks,
> Mukesh
> 
> > ---
> >   tools/perf/tests/event_update.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/tests/event_update.c b/tools/perf/tests/event_update.c
> > index cac4290e233a..7f0868a31a7f 100644
> > --- a/tools/perf/tests/event_update.c
> > +++ b/tools/perf/tests/event_update.c
> > @@ -92,7 +92,7 @@ int test__event_update(struct test *test __maybe_unused, int subtest __maybe_unu
> >   	evsel = perf_evlist__first(evlist);
> > -	TEST_ASSERT_VAL("failed to allos ids",
> > +	TEST_ASSERT_VAL("failed to allocate ids",
> >   			!perf_evsel__alloc_id(evsel, 1, 1));
> >   	perf_evlist__id_add(evlist, evsel, 0, 0, 123);

-- 

- Arnaldo
