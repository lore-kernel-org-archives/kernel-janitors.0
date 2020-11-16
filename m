From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Nov 2020 08:34:02 +0000
Subject: Re: [bug report] netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
Message-Id: <20201116083402.GA18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113085255.GA91999@mwanda>
In-Reply-To: <20201113085255.GA91999@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Nov 14, 2020 at 08:00:23PM -0700, Nathan Chancellor wrote:
> On Sat, Nov 14, 2020 at 12:45:16PM +0300, Dan Carpenter wrote:
> > On Fri, Nov 13, 2020 at 09:41:01AM -0500, Paul Moore wrote:
> > > On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > Hello Paul Moore,
> > > >
> > > > The patch 866358ec331f: "netlabel: fix our progress tracking in
> > > > netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> > > > static checker warning:
> > > >
> > > >         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
> > > >         error: uninitialized symbol 'iter_chain'.
> > > 
> > > Thanks Dan, I'll look at it today.  I'm a little confused as to why
> > > the compiler didn't flag that, but perhaps I just missed it.  Anyway,
> > > patch later today ...
> > 
> > GCC has stopped warning about these for some reason.  Very frustrating.
> 
> Most likely due to commit 78a5255ffb6a ("Stop the ad-hoc games with
> -Wno-maybe-initialized").

Ugh...  That explains it.  These days we have the GCC plugging which
initializes things to zero so some of these don't show up in testing.

regards,
dan carpenter
