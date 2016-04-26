From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 26 Apr 2016 13:41:07 +0000
Subject: Re: [patch] tracing: checking for NULL instead of IS_ERR()
Message-Id: <20160426094107.52dc2ea0@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160423102347.GA11136@mwanda>
	<571E6914.90708@linux.intel.com>
In-Reply-To: <571E6914.90708@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 25 Apr 2016 13:59:32 -0500
Tom Zanussi <tom.zanussi@linux.intel.com> wrote:

> Hi Dan,
> 
> On 04/23/2016 05:23 AM, Dan Carpenter wrote:
> > tracing_map_elt_alloc() returns ERR_PTRs on error, never NULL.
> >
> > Fixes: 08d43a5fa063 ('tracing: Add lock-free tracing_map')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >

> 
> Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

Applied.

Thanks Dan and Tom,

-- Steve
