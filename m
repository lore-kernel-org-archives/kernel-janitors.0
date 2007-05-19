From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 19 May 2007 19:05:25 +0000
Subject: Re: [KJ] how to add a new file to a patch?
Message-Id: <Pine.LNX.4.64.0705191503030.8800@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705191332540.12829@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705191332540.12829@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 19 May 2007, Francois Romieu wrote:

> Robert P. J. Day <rpjday@mindspring.com> :
> >
> >   i'm embarrassed to admit i don't know how to do this, and i've tried
> > a few things with no success.  how do i
> >
> > 1) create a patch that incorporates a brand new file?  i've tried to
> > "git add" the file but it doesn't show up in the subsequent "git diff"
> > as part of the patch.
>
> git diff --cached

ok, that works for just a new file, but it won't also show me changes
i've made to existing files.  i think i've found what i want:

  $ git diff HEAD

that seems to be the solution here.  thanks.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
