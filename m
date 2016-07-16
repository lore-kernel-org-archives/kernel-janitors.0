From: Stephane Eranian <eranian@google.com>
Date: Sat, 16 Jul 2016 16:30:51 +0000
Subject: Re: [patch 1/2] perf jit: add missing curly braces
Message-Id: <CABPqkBSpw7yPgAviUd5EXPiEPQ6g2PymHX6ABXmMf2TwHYz4ww@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715210712.GA19522@mwanda>
In-Reply-To: <20160715210712.GA19522@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jul 15, 2016 at 2:07 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> It doesn't change the runtime behavior, but my static checker complains
> that curly braces were intended.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
This was clearly a bug. It did not fire when padding=0 because you
never come out of the loop with sret != 0.
If padding=0, then you execute the fwrite() and then the sret test is
just after, so this was working but I agree
this was not the intended code flow.
Thanks for tracking this down.

> diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
> index 3573f31..91bf333 100644
> --- a/tools/perf/jvmti/jvmti_agent.c
> +++ b/tools/perf/jvmti/jvmti_agent.c
> @@ -491,10 +491,11 @@ jvmti_write_debug_info(void *agent, uint64_t code, const char *file,
>                 if (sret != 1)
>                         goto error;
>         }
> -       if (padding_count)
> +       if (padding_count) {
>                 sret = fwrite_unlocked(pad_bytes, padding_count, 1, fp);
>                 if (sret != 1)
>                         goto error;
> +       }
>
>         funlockfile(fp);
>         return 0;
