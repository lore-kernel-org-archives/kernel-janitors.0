From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Tue, 24 Aug 2010 12:52:12 +0000
Subject: Re: [PATCH 2/2] drivers/mtd/ubi: Eliminate update of
Message-Id: <1282654332.24044.170.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Sat, 2010-08-07 at 11:09 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> list_for_each_entry uses its first argument to move from one element to the
> next, so modifying it can break the iteration.  The variable re1 is already
> used within the loop as a temporary variable, and is not live here.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> iterator name list_for_each_entry;
> expression x,E;
> position p1,p2;
> @@
> 
> list_for_each_entry@p1(x,...) { <... x =@p2 E ...> }
> 
> @@
> expression x,E;
> position r.p1,r.p2;
> statement S;
> @@
> 
> *x =@p2 E
> ...
> list_for_each_entry@p1(x,...) S
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Pushed to ubi-2.6.git tree. This won't be seen in linux-next for some
time though, but I'll make it visible in linux-next at some point soon.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

