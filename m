From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 03 Jun 2007 08:09:33 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <Pine.LNX.4.64.0706030401590.14197@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2 Jun 2007, Andi Drebes wrote:

> To clarify that affair: No, I didn't want to write a big patch that
> removes those lines. I just aked for a reason why those lines should
> be kept in the tree. Even if I had not asked why, I wouldn't have
> written such a patch. Instead I would have inspected these lines in
> detail (which is btw what I'm going to do whenever I encounter such
> lines in the future).

i doubt it's a good investment of time to *explicitly* try to remove
stuff enclosed in "#if 0" -- you're probably better off picking a
specific item or topic from the list of projects and working on that,
unless you just happen to stumble across commented out stuff that
looks like a good candidate for removal.

in addition, make sure you have a good idea of what portions of the
source tree are already slated for removal, and don't waste any time
there.  for example, there's no point in doing *any* cleanup of the
entire OSS sound system, since that's going to be tossed
*entirely* someday.  (but don't base that kind of decision on the
feature removal file Documentation/feature-removal-schedule.txt --
that file is virtually worthless in terms of accurate information
content.)

one strategy i've used on occasion when i'm bored is to just search
the entire tree looking for the words "deprecated" or "obsolete" and
seeing what turns up.

in any event, i should probably spend a few minutes and clean up the
project list here:

http://fsdev.net/wiki/index.php?title=Kernel_Janitor%27s_Todo_List

to remove items that look like they're basically done.

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
