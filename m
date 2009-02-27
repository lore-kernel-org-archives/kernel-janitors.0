From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Date: Fri, 27 Feb 2009 01:37:42 +0000
Subject: Re: [PATCH 14/16] memcg: fix sparse warning: Using plain integer as
Message-Id: <20090227103742.8376ab5c.kamezawa.hiroyu@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	<20090222000532.17557.52930.stgit@vmbox.hanneseder.net>
	<154e089b0902261715p3d1a865ep845e0f1345549ebb@mail.gmail.com>
In-Reply-To: <154e089b0902261715p3d1a865ep845e0f1345549ebb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 27 Feb 2009 02:15:46 +0100
Hannes Eder <hannes@hanneseder.net> wrote:

> [Added To]
> 
Thanks,

Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

> On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> > Fix this sparse warning:
> >  mm/memcontrol.c:1637:32: warning: Using plain integer as NULL pointer
> >
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> > ---
> >  mm/memcontrol.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 8e4be9c..09d6650 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -1634,7 +1634,7 @@ static int mem_cgroup_force_empty_list(struct mem_cgroup *mem,
> >                pc = list_entry(list->prev, struct page_cgroup, lru);
> >                if (busy = pc) {
> >                        list_move(&pc->lru, list);
> > -                       busy = 0;
> > +                       busy = NULL;
> >                        spin_unlock_irqrestore(&zone->lru_lock, flags);
> >                        continue;
> >                }
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

