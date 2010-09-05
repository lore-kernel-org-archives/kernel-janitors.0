From: David Rientjes <rientjes@google.com>
Date: Sun, 05 Sep 2010 22:00:33 +0000
Subject: Re: [PATCH 14/14] mm: oom_kill: use IS_ERR() instead of strict
Message-Id: <alpine.DEB.2.00.1009051500200.5003@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711592-7669-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711592-7669-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

On Sun, 5 Sep 2010, Kulikov Vasiliy wrote:

> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Use IS_ERR() instead of strict checking.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: David Rientjes <rientjes@google.com>
