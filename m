From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 04 Feb 2007 09:43:45 +0000
Subject: [KJ] another potential KJ project -- cleaning out Documentation/
Message-Id: <Pine.LNX.4.64.0702040437130.26073@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  not sure if this is a viable project, but it strikes me that there's
a *heap* of stuff in the current 2.6 Documentation/ directory that
could be either reorganized, updated or outright deleted.  and, in
this case, deletion of outdated content *would* have its value since
out-of-date documentation can be annoyingly misleading and a real time
waster.

  in terms of reorganization, i think it would be nice to see more of
a hierarchical structure.  for example, i can imagine a single
"debugging" directory with all debugging-related text files.

  perhaps another one called "developers" which would contain
everything related to submitting patches and drivers, and the
submission checklist, etc, etc.  you get the idea.

  and in terms of outright deletion, not to pick on any one
architecture but just grabbing something at random, there's a "cris"
directory with a single README file for its contents, that begins:

Linux 2.4 on the CRIS architecture
=================
$Id: README,v 1.7 2001/04/19 12:38:32 bjornw Exp $
...

if this really is 2.4-specific content, its value in the 2.6.20 kernel
tree is fairly low, if not non-existent.

  anyway, thoughts?  there's a lot of valuable info in the
Documentation/ directory, but it seems to be getting increasingly
buried under aging and obsolete content.

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
