From: Tejun Heo <tj@kernel.org>
Date: Fri, 17 Jul 2009 06:31:33 +0000
Subject: Re: [PATCH 1/4] drivers/block: adjust NULL test
Message-Id: <4A601AC5.1010308@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907132243110.12374@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907132243110.12374@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> dtp is derefenced on the lines above the test !dtp, and so it cannot be
> NULL at this point.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r@
> expression x,E,E1;
> identifier f,l;
> position p1,p2;
> @@
> 
> *x@p1->f = E1;
> ... when != x = E
>     when != goto l;
> (
> *x@p2 = NULL
> |
> *x@p2 != NULL
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Indeed, added to my temp block tree.  Will forward upstream in a few
days.

Thanks.

-- 
tejun
