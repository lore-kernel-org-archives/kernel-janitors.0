From: Julia Lawall <julia@diku.dk>
Date: Sat, 28 Aug 2010 17:17:16 +0000
Subject: Re: [PATCH 2/7] drivers/usb/gadget: Remove double test
Message-Id: <Pine.LNX.4.64.1008281916580.13508@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <581556.29157.qm@web180314.mail.gq1.yahoo.com>
 <Pine.LNX.4.64.1008281852450.13508@ask.diku.dk> <4C79435B.2030303@s5r6.in-berlin.de>
In-Reply-To: <4C79435B.2030303@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: David Brownell <david-b@pacbell.net>, Thomas Dahlmann <dahlmann.thomas@arcor.de>, kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 28 Aug 2010, Stefan Richter wrote:

> Julia Lawall wrote:
> > On Sat, 28 Aug 2010, David Brownell wrote:
> > 
> >> Please update $SUBJECT to say which driver is
> >> affected;
> > 
> > Done.
> > 
> >> it's not everything in that directory,
> >> and accurate GIT summaries help a lot.
> > 
> > Is there some sort of rule that can be followed?  For example, if the 
> > patch affects only one, file, should that file be named?  What if the 
> > patch affects only two files?
> 
> gitk $path or git shortlog $path, with $path being the file or directory, give
> a quick impression how the resident developers call their driver or subsystem
> updates.  E.g. ^USB: instead of ^drivers/usb/.
> 
> However, the committer could still adjust the title, so no drama if the patch
> subject as written by a cross-tree developer looks different from those of the
> usual subsystem patches.  IMO this is one of the tasks of a subsystem
> maintainer.  And it is quickly enough done with a git commit --amend.
> 
> There is only a drawbackif the subject is too broad /and/ if the Cc list is
> too short;  a driver developer may miss to see the submission.  The danger of
> that is low though when get_maintainer.pl is used to good effect.

OK, thanks.

julia
