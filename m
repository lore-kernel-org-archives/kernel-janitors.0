From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Mon, 23 Jan 2017 22:56:34 +0000
Subject: Re: [PATCH 3/4] perf session: Move an error code assignment in __perf_session__set_tracepoints_handl
Message-Id: <20170124075634.76af7bfb0dd7d074cb8dd682@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
        <b9ccdf98-e7a9-e4a2-67d7-24617d4b87a6@users.sourceforge.net>
In-Reply-To: <b9ccdf98-e7a9-e4a2-67d7-24617d4b87a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 23 Jan 2017 16:25:23 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 23 Jan 2017 15:43:13 +0100
> 
> A local variable was set to an error code before a concrete error situation
> was detected. Thus move the corresponding assignment into an if branch
> to indicate a software failure there.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  tools/perf/util/session.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> index f268201048a0..98605ad4affd 100644
> --- a/tools/perf/util/session.c
> +++ b/tools/perf/util/session.c
> @@ -2050,10 +2050,10 @@ int __perf_session__set_tracepoints_handlers(struct perf_session *session,
>  		evsel = perf_evlist__find_tracepoint_by_name(session->evlist, assocs[i].name);
>  		if (evsel = NULL)
>  			continue;
> -
> -		err = -EEXIST;
> -		if (evsel->handler != NULL)
> +		if (evsel->handler) {
> +			err = -EEXIST;
>  			goto out;
> +		}
>  		evsel->handler = assocs[i].handler;
>  	}

Hmm, if we cleanup this function, it might be better not to use goto as below.

int __perf_session__set_tracepoints_handlers(struct perf_session *session,
                                             const struct perf_evsel_str_handler *assocs,
                                             size_t nr_assocs)
{
        struct perf_evsel *evsel;
        size_t i;
        int err = 0;

        for (i = 0; i < nr_assocs; i++) {
                /*
                 * Adding a handler for an event not in the session,
                 * just ignore it.
                 */
                evsel = perf_evlist__find_tracepoint_by_name(session->evlist, assocs[i].name);
                if (evsel = NULL)
                        continue;

                if (evsel->handler != NULL) {
                        err = -EEXIST;
                        break;
		}
                evsel->handler = assocs[i].handler;
        }

        return err;
}

Thank you,



-- 
Masami Hiramatsu <mhiramat@kernel.org>
