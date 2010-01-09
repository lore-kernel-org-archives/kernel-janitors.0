From: Dan Carpenter <error27@gmail.com>
Date: Sat, 09 Jan 2010 08:53:25 +0000
Subject: [announce] smatch 1.54
Message-Id: <20100109085325.GE7840@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch is a static checker for C.  Download it here:  
http://repo.or.cz/w/smatch.git

These days there are at least seven static checkers people are using 
to check the kernel source.  I can't swear that it's better than all
the others...  Smatch is open source.  It's written in C.  It's based
on sparse.  It's not horribly slow.  It has a git repo that gets updated
every few days.

Really what I would like is for smatch to become a smarter version
of checkpatch.pl.  I'd like it to be something simple, that catches many 
types of common bugs.  Something that people run before submitting code.
It's still probably a year away from being good enough for that.

Since the last release:
	* You need to pass "-p=kernel" to check the kernel source.
	make CHECK="/path/to/smatch -p=kernel" C=1 bzImage

	* The output has been cleaned up.  You can still pass --spammy
	and --info if you want the old output.

	* The array overflow check has improved and finds around 30
	bugs in the 2.6.33-rc2 kernel.

	* There is a new "dma on the stack" check that finds 382
	bugs.  The ones from drivers/usb/serial/ have fixes already.
	This could maybe be rewritten as a Coccinelle script.  The
	fixes are pretty mechanical.

That's the main stuff.

From what I can tell about the open source checkers is that only the
authors use them.  Smatch has two users besides me (they do userspace 
stuff so they're not on this list), so it's one of the most popular.

Anyway, feedback is always good.  :)

regards,
dan carpenter
