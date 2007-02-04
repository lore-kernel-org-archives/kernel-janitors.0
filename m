From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 04 Feb 2007 18:04:09 +0000
Subject: Re: [KJ] another potential KJ project -- cleaning out Documentation/
Message-Id: <Pine.LNX.4.64.0702041259340.2678@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702040437130.26073@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702040437130.26073@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 4 Feb 2007, walter harms wrote:

> Robert P. J. Day wrote:
> >   not sure if this is a viable project, but it strikes me that there's
... snip ...
> > Linux 2.4 on the CRIS architecture
> > =================
> > $Id: README,v 1.7 2001/04/19 12:38:32 bjornw Exp $
> > ...
> >
> > if this really is 2.4-specific content, its value in the 2.6.20 kernel
> > tree is fairly low, if not non-existent.
> >
> >   anyway, thoughts?  there's a lot of valuable info in the
> > Documentation/ directory, but it seems to be getting increasingly
> > buried under aging and obsolete content.
> >
> > rday
> >
>
> This CRIS processor is supported also with the 2.6 architecture.

oh, i realize that.  but note that that content is titled "Linux 2.4
                                                                 ^^^
on the CRIS architecture".  so either that content is still valid for
2.6 and its title should be updated, or the content is not relevant to
2.6 and it should be dropped from the tree.

no matter what the situation is, any documentation that is *solely*
for the 2.4 kernel really has no place in the 2.6 documentation
directory.

rday

p.s.  one non-intrusive possibility is to create a directory named
"OLD" in the Doc directory, and move apparently outdated content
there.  that gets it out of the way, but it's easily fetchable by
anyone who still wants it.

-- 

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
