From: John Daiker <daikerjohn@gmail.com>
Date: Fri, 12 Jun 2009 22:15:26 +0000
Subject: Building vmlinux without date/timestamp bits
Message-Id: <4A32D37E.40507@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm working on various trivial patches (mainly whitespace and 
checkpatch.pl cleanups).

I read quite some time ago that it's best to md5sum the vmlinux file 
before and after these trivial patches are applied (to ensure that no 
executable code has changed, modules on a binary level are identical, etc).

So far, I have no problems producing identical .o and .ko files with my 
trivial patches.  My problem lies in the resulting vmlinux and vmlinux.o 
file, though.

I know the files are different due to date/timestamping the kernel, but 
I'm not sure where this happens (and how I can prevent it).  Are there 
pieces of code and/or Makefile that I can comment out so that the 
resulting vmlinux file isn't timestamped (and thus would be an exactly 
identical before and after).  I know it can be done... I've done it 
before (years ago), but seem to have forgotten the trick.

Thanks for the help!

John Daiker
