From: David Rientjes <rientjes@google.com>
Date: Mon, 06 Sep 2010 08:59:34 +0000
Subject: Re: [PATCH 14/14] mm: oom_kill: use IS_ERR() instead of strict
Message-Id: <alpine.DEB.2.00.1009060155250.10552@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711592-7669-1-git-send-email-segooon@gmail.com> <20100906094555.C8BB.A69D9226@jp.fujitsu.com>
In-Reply-To: <20100906094555.C8BB.A69D9226@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan.kim@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Mon, 6 Sep 2010, KOSAKI Motohiro wrote:

> > From: Vasiliy Kulikov <segooon@gmail.com>
> > 
> > Use IS_ERR() instead of strict checking.
> 
> Umm...
> 
> I don't like this. IS_ERR() imply an argument is error code. but in
> this case, we don't use error code. -1 mean oom special purpose meaning
> value.
> 

You could make the same argument by saying the current use of PTR_ERR() 
implies an error code.  We've simply hijacked -1UL for simplicity in this 
case and because select_bad_process() can only return one other value 
besides a pointer to a process or NULL.

> So, if we take this direction, It would be better to use EAGAIN or something
> instead -1.
> 

I agree it would probably better to return ERR_PTR(-EAGAIN) instead of 
using -1UL.
