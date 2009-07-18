From: Ingo Molnar <mingo@elte.hu>
Date: Sat, 18 Jul 2009 10:16:53 +0000
Subject: Re: [PATCH 2/3] tracing: removing struct module* parameter from
Message-Id: <20090718101653.GC24164@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1247773468-11594-1-git-send-email-jolsa@redhat.com> <1247773468-11594-3-git-send-email-jolsa@redhat.com>
In-Reply-To: <1247773468-11594-3-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jolsa@redhat.com
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* jolsa@redhat.com <jolsa@redhat.com> wrote:

> The "struct module*" is not being used in the ftrace_init_module 
> code path, removing it.
>
> wbr,
> jirka
> 
> Signed-off-by: Jiri Olsa <jolsa@redhat.com>
> 
> ---
>  arch/x86/kernel/ftrace.c |    3 +--
>  include/linux/ftrace.h   |    4 +---
>  kernel/trace/ftrace.c    |   25 +++++++++++--------------
>  3 files changed, 13 insertions(+), 19 deletions(-)

patch didnt apply cleanly to the latest tracing tree:

  http://people.redhat.com/mingo/tip.git/README

and the other bits had some fuzz as well. Mind merging + resending 
this?

	Ingo
