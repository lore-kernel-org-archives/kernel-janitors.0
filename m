From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Wed, 15 Nov 2006 00:04:31 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <20061114160431.068046ca.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	<200611020144.51196.jesper.juhl@gmail.com>
	<454945FA.8030901@oracle.com>
	<200611020223.43011.jesper.juhl@gmail.com>
	<20061101172241.84439229.randy.dunlap@oracle.com>
In-Reply-To: <20061101172241.84439229.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Andrew Morton <akpm@osdl.org>, Neil Horman <nhorman@tuxdriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On Wed, 1 Nov 2006 17:22:41 -0800 Randy Dunlap wrote:

> On Thu, 2 Nov 2006 02:23:42 +0100 Jesper Juhl wrote:
> 
> > On Thursday 02 November 2006 02:12, Randy Dunlap wrote:
> > > Jesper Juhl wrote:
> > > > On Thursday 02 November 2006 01:27, Andrew Morton wrote:
> > > >> On Wed, 1 Nov 2006 16:11:55 -0800
> > > >> Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > > >>
> > > >>>> Hmm, I guess that should be defined once and for all in
> > > >>>> Documentation/CodingStyle
> > > >>> I have some other CodingStyle changes to submit, but feel free
> > > >>> to write this one up.
> > > >> Starting labels in column 2 gives me the creeps, personally.  But there's a
> > > >> decent justification for it.
> > > >>
> > > >>> However, I didn't know that we had a known style for this, other
> > > >>> than "not indented so far that it's hidden".
> > > >>>
> > > >>> If a label in column 0 [0-based :] confuses patch, then that's
> > > >>> a reason, I suppose.  I wasn't aware of that one...
> > > >>> In a case like that, we usually say "fix the tool then."
> > > >> The problem is that `diff -p' screws up and displays the label: in the
> > > >> place where it should be displaying the function name.
> > > >>
> > > >> Of course, lots of people forget the -p anyway...  Maybe we can fix those
> > > >> tools ;)
> > > >>
> > > > Until the tools get fixed, how about applying this patch ?
> > > > 
> > > > 
> > > > Add CodngStyle info on labels.
> > > > 
> > [snip]
> > > > +generally it is prefered that labels be placed at column 1.
> > > 		~~~~~~~~~~~~
> > > 		preferred
> > > 
> > > I would also say something like this:
> > > 
> > > Labels should stand out -- be easily visible.  They should not be
> > > indented so much that they are hidden or obscured by the surrounding
> > > source code.
> > > 
> > Ok, how's this :
> > 
> > Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
> > ---
> > 
> > diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
> > index 29c1896..4f6b2d5 100644
> > --- a/Documentation/CodingStyle
> > +++ b/Documentation/CodingStyle
> > @@ -566,6 +566,21 @@ result.  Typical examples would be funct
> >  NULL or the ERR_PTR mechanism to report failure.
> >  
> >  
> > +		Chapter 17: Labels
> > +
> > +Label names should be lowercase.
> > +
> > +Label names should start with a letter [a-z].
> > +
> > +Labels should not be placed at column 0. Doing so confuses some tools, most
> > +notably 'diff' and 'patch'. Instead place labels at column 1 (indented 1
> > +space). In some cases it's OK to indent labels one or more tabs, but
> > +generally it is preferred that labels be placed at column 1.
> > +
> > +Labels should stand out - be easily visible. They should not be indented so
> > +much that they are hidden or obscured by the surrounding source code.
> > +
> > +
> >  
> >  		Appendix I: References
> 
> Yep, OK with me.  (Ack)
> ---

Did Andrew ever pick up this doc. patch?

Anyway, I wanted to see the problem with 'diff' and labels in column 0
causing 'diff -p' @@ tags to be confused, but when I tested it,
it Works For Me.  No difference in diff @@ tags if I indent the
labels or not.  or is this too simple?
---

not-sob: just a patch to test diff -p and labels in column 0:

---
 lib/vsprintf.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-2.6.19-rc3-git6.orig/lib/vsprintf.c
+++ linux-2.6.19-rc3-git6/lib/vsprintf.c
@@ -279,8 +279,9 @@ int vsnprintf(char *buf, size_t size, co
 		static int warn = 1;
 		WARN_ON(warn);
 		warn = 0;
-		return 0;
+		goto ret0;
 	}
+notret0:
 
 	str = buf;
 	end = buf + size;
@@ -493,6 +494,8 @@ int vsnprintf(char *buf, size_t size, co
 	}
 	/* the trailing null byte doesn't count towards the total */
 	return str-buf;
+ret0:
+	return 0;
 }
 
 EXPORT_SYMBOL(vsnprintf);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
