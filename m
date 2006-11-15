From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 15 Nov 2006 09:05:35 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <9a8748490611150105u2c3c1a4fucc3e7ad5f1fd1d77@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	 <200611020144.51196.jesper.juhl@gmail.com>
	 <454945FA.8030901@oracle.com>
	 <200611020223.43011.jesper.juhl@gmail.com>
	 <20061101172241.84439229.randy.dunlap@oracle.com>
	 <20061114160431.068046ca.randy.dunlap@oracle.com>
In-Reply-To: <20061114160431.068046ca.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andrew Morton <akpm@osdl.org>, Neil Horman <nhorman@tuxdriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On 15/11/06, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Wed, 1 Nov 2006 17:22:41 -0800 Randy Dunlap wrote:
>
> > On Thu, 2 Nov 2006 02:23:42 +0100 Jesper Juhl wrote:
> >
...
> > >
> > > Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
> > > ---
> > >
> > > diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
> > > index 29c1896..4f6b2d5 100644
> > > --- a/Documentation/CodingStyle
> > > +++ b/Documentation/CodingStyle
> > > @@ -566,6 +566,21 @@ result.  Typical examples would be funct
> > >  NULL or the ERR_PTR mechanism to report failure.
> > >
> > >
> > > +           Chapter 17: Labels
> > > +
> > > +Label names should be lowercase.
> > > +
> > > +Label names should start with a letter [a-z].
> > > +
> > > +Labels should not be placed at column 0. Doing so confuses some tools, most
> > > +notably 'diff' and 'patch'. Instead place labels at column 1 (indented 1
> > > +space). In some cases it's OK to indent labels one or more tabs, but
> > > +generally it is preferred that labels be placed at column 1.
> > > +
> > > +Labels should stand out - be easily visible. They should not be indented so
> > > +much that they are hidden or obscured by the surrounding source code.
> > > +
> > > +
> > >
> > >             Appendix I: References
> >
> > Yep, OK with me.  (Ack)
> > ---
>
> Did Andrew ever pick up this doc. patch?
>
Not as far as I know.


> Anyway, I wanted to see the problem with 'diff' and labels in column 0
> causing 'diff -p' @@ tags to be confused, but when I tested it,
> it Works For Me.  No difference in diff @@ tags if I indent the
> labels or not.  or is this too simple?

I must admit that I've not been able to cause a failure either, an
example would be nice.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
