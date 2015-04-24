From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Apr 2015 13:00:29 +0000
Subject: Re: [PATCH] fs/compat: remove redundant 'less than zero' check
Message-Id: <20150424130029.GD16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429870070-30310-1-git-send-email-firogm@gmail.com>
 <20150424120453.GO14154@mwanda>
 <alpine.DEB.2.10.1504241423060.2949@hadrien>
In-Reply-To: <alpine.DEB.2.10.1504241423060.2949@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Firo Yang <firogm@gmail.com>, viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Fri, Apr 24, 2015 at 02:23:23PM +0200, Julia Lawall wrote:
> On Fri, 24 Apr 2015, Dan Carpenter wrote:
> 
> > On Fri, Apr 24, 2015 at 06:07:50PM +0800, Firo Yang wrote:
> >
> > > -	if (nr_segs > UIO_MAXIOV || nr_segs < 0)
> > > +	if (nr_segs > UIO_MAXIOV)
> >
> > Linus said at kernel summit that he thinks this kind of checks are ok.
> >
> > Smatch already ignores checks like:
> >
> > 	if (nr_segs < 0 || nr_segs > UIO_MAXIOV)
> >
> > So making it ignore this one as well shouldn't be hard...  I'll change
> > Smatch to ignore this one as well.
> 
> It is unsigned.  What is the point of cluttering the code?

I guess I don't feel strongly either way.  It was Linus who said
something like "the intent is clear from the code" so he isn't a fan of
these particular static checker fixes.

These are easy enough for me to filter out so they needn't cause a false
positive.

They're more of a style issue than anything else.  With coccinelle, it's
easier to care about style issues because you can fix them automatically.
In Smatch caring about style issues is a time suck.

regards,
dan carpenter

