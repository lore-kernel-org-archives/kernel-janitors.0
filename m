From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Mar 2020 08:38:16 +0000
Subject: Re: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <20200310083816.GA11561@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
 <CAK+_RLm9=DER3fM-HwvM14CEzq8eZCwcTZyoA6tsYdhe1J03sA@mail.gmail.com>
In-Reply-To: <CAK+_RLm9=DER3fM-HwvM14CEzq8eZCwcTZyoA6tsYdhe1J03sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tigran Aivazian <aivazian.tigran@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Mar 09, 2020 at 09:14:27AM +0000, Tigran Aivazian wrote:
> Hello Dan,
> 
> On Sat, 7 Mar 2020 at 06:08, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > -       int namelen = child->len;
> > +       unsigned int namelen = child->len;
> 
> Thank you, that is sensible, but have you actually verified that
> attempting a lookup of a filename longer than 2.2 billion bytes causes
> a problem? If that's the case, then your patch should be considered.
> If not, it would seem to be a waste of time to worry about something
> that cannot ever happen.

As the commit message says, this is just to silence a static checker
warning about checking for upper bounds but ignoring negatives.  The
check has found a number of problems in the past but it becomes less
useful if security reviewers have to sort through a bunch of false
positives.

regards,
dan carpenter
