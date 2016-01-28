From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 Jan 2016 09:48:12 +0000
Subject: Re: [PATCH] net/mac80211/agg-rx.c: fix use of uninitialised values
Message-Id: <1453974492.2217.2.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126111730.GA6765@localhost>
	 <20160127154618.GA5717@localhost>
	 <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com>
	 (sfid-20160128_002736_648758_DED52DA5)
In-Reply-To: <CAGRGNgXkvNfzM9Q1RO5kFwUWpFZbQ3mNQi3aVHcPTCw0A9fyFA@mail.gmail.com> (sfid-20160128_002736_648758_DED52DA5)
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julian Calaby <julian.calaby@gmail.com>, Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, aryabinin@virtuozzo.com, Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

On Thu, 2016-01-28 at 10:27 +1100, Julian Calaby wrote:
>=C2=A0
> This looks like a "big hammer" solution to this problem.

It is, in a way, but it also avoids future errors like it.

> I'd prefer to just set ->removed to false right after we set
> ->auto_seq as that should be faster, however I don't know if
> __ieee80211_start_rx_ba_session() is a fast path so I don't know if
> this is saving anything.

It's not supposed to be called frequently, no.

> On another note, this is an error that should be pretty easy to spot.
> Could any of the automated tools find cases where a struct containing
> a bool variable is kmalloc'd and returned without assigning all the
> bools?

I think you'd quickly drown in false positives, since "return" isn't
necessarily something that means it needs to have been fully
initialized.

johannes
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
