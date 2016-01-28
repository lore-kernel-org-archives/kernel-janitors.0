From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 Jan 2016 12:35:12 +0000
Subject: Re: [PATCH] net/mac80211/agg-rx.c: fix use of uninitialised values
Message-Id: <1453984512.2217.15.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126111730.GA6765@localhost>
	 <20160127154618.GA5717@localhost>
	 <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com>
	 <20160128123022.GB13219@mwanda>
In-Reply-To: <20160128123022.GB13219@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Julian Calaby <julian.calaby@gmail.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, aryabinin@virtuozzo.com, Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

On Thu, 2016-01-28 at 15:30 +0300, Dan Carpenter wrote:
> It's not the return where we should trigger the warning it's at the
> 
> 	rcu_assign_pointer(sta->ampdu_mlme.tid_rx[tid], tid_agg_rx);
> 
> line.  That's for correctness, but also it should be slightly easier.
> Or it should cut down on false positives if we ignored returns and
> only looked global scope type assignements.

That's a good idea! But even that will probably get you a lot of false
positives. For example, in this structure, the rcu_head is never
initialized until we need it for kfree_rcu() or call_rcu(). I'm sure
there are other places like it.

johannes
