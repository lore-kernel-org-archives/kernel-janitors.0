From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 03 Feb 2007 17:16:36 +0000
Subject: Re: [KJ] some *seriously* deceased code in the tree
Message-Id: <Pine.LNX.4.64.0702031215080.8847@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702030436460.24858@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702030436460.24858@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 3 Feb 2007, Matthew Wilcox wrote:

> On Sat, Feb 03, 2007 at 04:43:36AM -0500, Robert P. J. Day wrote:

> >   more importantly, though, this strikes me as a misuse of the
> > official kernel tree -- as an archival dumping ground for snippets
> > of code that have no immediate value but might someday be useful
> > so, what the heck, let's throw it in there and, who knows, we
> > might get back to it but maybe not.
> >
> >   IMHO, that's the sort of thing that deserves to be ripped out
> > without a moment's hesitation.
>
> What harm does it do to leave it alone?  There's about a billion
> more important things to spend time on than this.

*technically*, of course, it doesn't do any harm at all.  but given
that people on the KJ list might be looking for small projects, what's
wrong with identifying and removing code that has absolutely no value
anymore?

i mean, any software project that has over 2500 "#if 0" directives
scattered through it wouldn't suffer from a little cleanup.

rday

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
