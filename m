From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Apr 2018 15:58:12 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <20180411155811.2qznymjhi6zlzgbb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com>
 <20180411132613.18974-1-colin.king@canonical.com>
 <23535.1523453966@warthog.procyon.org.uk>
 <24493.1523455816@warthog.procyon.org.uk>
In-Reply-To: <24493.1523455816@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Colin Ian King <colin.king@canonical.com>, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 11, 2018 at 03:10:16PM +0100, David Howells wrote:
> Colin Ian King <colin.king@canonical.com> wrote:
> 
> > >> -	mask = (1 << nr_slots) - 1;
> > >> +	mask = (1ULL << nr_slots) - 1;
> > > 
> > > nr_slots cannot be larger than 9, so what I wrote is actually fine and is
> > > more efficient on a 32-bit machine.
> > 
> > ok, sorry about the noise.
> 
> It would be possible to cast the value to u64 before assigning it, I suppose.
> Would that help?  E.g.:
> 
> 	mask = (u64)((1 << nr_slots) - 1);
> 
> It looks a bit odd, though, since the cast is made implicitly anyway.

My feeling is that makes it worse.  It would introduce a secret,
unpublished static checker warning on my build and it doesn't help me as
a reviewer.

Ideally static analyzers should know that nr_slots is 0-9, but right now
that seems pretty tricky to figure out...

regards,
dan carpenter

