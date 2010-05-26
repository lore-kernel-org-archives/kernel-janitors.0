From: Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 26 May 2010 16:32:27 +0000
Subject: Re: [PATCH 3/17] arch/mips/kernel: Add missing read_unlock
Message-Id: <20100526163227.GA17043@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261754390.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261754390.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, "Kevin D. Kissell" <kevink@paralogos.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 26, 2010 at 05:54:55PM +0200, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Add a read_unlock missing on the error path.  Other ways of reaching
> out_unlock have tasklist_lock unlocked.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E1;
> @@
> 
> * read_lock(E1,...);
>   <+... when != E1
>   if (...) {
>     ... when != E1
> *   return ...;
>   }
>   ...+>
> * read_unlock(E1,...);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> I wasn't able to find what security_task_setscheduler actually does.  
> If it releases tasklist_lock in an error case, then ignire this patch.

Your patch appears correct - and mipsmt_sys_sched_setaffinity() even
more broken than you thought.  It duplicates some code from kernel/sched.c
and has gotten out of sync.

Fixing that up.

   Ralf
