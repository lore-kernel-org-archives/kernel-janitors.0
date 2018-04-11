From: David Howells <dhowells@redhat.com>
Date: Wed, 11 Apr 2018 14:10:16 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <24493.1523455816@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com> <20180411132613.18974-1-colin.king@canonical.com> <23535.1523453966@warthog.procyon.org.uk>
In-Reply-To: <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> >> -	mask = (1 << nr_slots) - 1;
> >> +	mask = (1ULL << nr_slots) - 1;
> > 
> > nr_slots cannot be larger than 9, so what I wrote is actually fine and is
> > more efficient on a 32-bit machine.
> 
> ok, sorry about the noise.

It would be possible to cast the value to u64 before assigning it, I suppose.
Would that help?  E.g.:

	mask = (u64)((1 << nr_slots) - 1);

It looks a bit odd, though, since the cast is made implicitly anyway.

David
