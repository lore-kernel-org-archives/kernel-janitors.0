From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 11 Feb 2009 09:16:13 +0000
Subject: Re: [PATCH 0/3] trace: fix sparse warnings
Message-Id: <20090211091613.GJ21105@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090210184214.28131.90564.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090210184214.28131.90564.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>


* Hannes Eder <hannes@hanneseder.net> wrote:

> The following series fixes some sparse warnings in kernel/trace.
> 
> ---
> 
> Hannes Eder (3):
>       trace: fix sparce warning: attribute function with __acquires/__releases
>       trace: fix sparse warnings: fix (un-)signedness
>       trace: fix sparse warnings: make symbols static
> 
> 
>  kernel/trace/ring_buffer.c |    8 ++++----
>  kernel/trace/trace.c       |   18 +++++++++++-------
>  2 files changed, 15 insertions(+), 11 deletions(-)

Applied to tip:tracing/ftrace (with minor edits), thanks Hannes!

	Ingo
