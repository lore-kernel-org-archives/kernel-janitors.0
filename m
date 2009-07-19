From: Jiri Olsa <jolsa@redhat.com>
Date: Sun, 19 Jul 2009 18:47:19 +0000
Subject: Re: [PATCH 2/3] tracing: removing struct module* parameter from
Message-Id: <20090719184719.GA3040@jolsa.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1247773468-11594-1-git-send-email-jolsa@redhat.com> <1247773468-11594-3-git-send-email-jolsa@redhat.com> <20090718101653.GC24164@elte.hu>
In-Reply-To: <20090718101653.GC24164@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 18, 2009 at 12:16:53PM +0200, Ingo Molnar wrote:
> 
> * jolsa@redhat.com <jolsa@redhat.com> wrote:
> 
> > The "struct module*" is not being used in the ftrace_init_module 
> > code path, removing it.
> >
> > wbr,
> > jirka
> > 
> > Signed-off-by: Jiri Olsa <jolsa@redhat.com>
> > 
> > ---
> >  arch/x86/kernel/ftrace.c |    3 +--
> >  include/linux/ftrace.h   |    4 +---
> >  kernel/trace/ftrace.c    |   25 +++++++++++--------------
> >  3 files changed, 13 insertions(+), 19 deletions(-)
> 
> patch didnt apply cleanly to the latest tracing tree:
> 
>   http://people.redhat.com/mingo/tip.git/README
> 
> and the other bits had some fuzz as well. Mind merging + resending 
> this?
> 
> 	Ingo

sure, np.. I made it against the linus' tree, I'll use the 
tip tree next time

jira
