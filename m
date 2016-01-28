From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2016 12:30:22 +0000
Subject: Re: [PATCH] net/mac80211/agg-rx.c: fix use of uninitialised values
Message-Id: <20160128123022.GB13219@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126111730.GA6765@localhost>
 <20160127154618.GA5717@localhost>
 <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com>
In-Reply-To: <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, aryabinin@virtuozzo.com, Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

It's not the return where we should trigger the warning it's at the

	rcu_assign_pointer(sta->ampdu_mlme.tid_rx[tid], tid_agg_rx);

line.  That's for correctness, but also it should be slightly easier.
Or it should cut down on false positives if we ignored returns and only
looked global scope type assignements.

regards,
dan carpenter

