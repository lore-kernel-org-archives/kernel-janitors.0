From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 02 Jul 2020 15:07:25 +0000
Subject: Re: [PATCH] perf header: Fix possible memory leak when using do_read_string
Message-Id: <de57c10a-1dbf-098a-27da-6f16275e5979@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: tongtiangen <tongtiangen@huawei.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Wei Yongjun <weiyongjun1@huawei.com>

> In the header.c file, some functions allocate memory after using
> do_read_string, but the corresponding memory is not released after
> subsequent processing errors, causing memory leaks.

I suggest to choose an imperative wording for this change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=cd77006e01b3198c75fb7819b3d0ff89709539bb#n151


…
> +++ b/tools/perf/util/header.c
> @@ -2307,8 +2307,10 @@  static int process_cpu_topology(struct feat_fd *ff, void *data __maybe_unused)
>  			goto error;
>
>  		/* include a NULL character at the end */
> -		if (strbuf_add(&sb, str, strlen(str) + 1) < 0)
> +		if (strbuf_add(&sb, str, strlen(str) + 1) < 0) {
> +			free(str);
>  			goto error;
> +		}
>  		size += string_size(str);
…

I propose to add the jump target “free_str” for nicer exception handling
in this function implementation.

Regards,
Markus
