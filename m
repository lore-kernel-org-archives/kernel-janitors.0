From: "Ted Ts'o" <tytso@mit.edu>
Date: Mon, 26 Jul 2010 11:23:17 +0000
Subject: Re: check capabilities in open()
Message-Id: <20100726112317.GB9185@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100724160701.GA4907@albatros>
 <20100724182355.GA9134@ZenIV.linux.org.uk>
 <20100725054511.GB9018@albatros>
In-Reply-To: <20100725054511.GB9018@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 25, 2010 at 09:45:11AM +0400, Vasiliy Kulikov wrote:
> 
> Root can open apm file (as->suser would be true), pass it to
> unpriviledged process and it would be able to suspend the system
> (as->suser would be still true).

The flip side of this --- and why these devices were deliberately
coded that way, is a setuid root program can open the apm file, and
then drop its root privileges for safety, so that if there is a buffer
overrun in the program, the attacker doesn't get root privileges.
This is quite common in Unix/Linux implementation pattern; let a
setuid program do wha it needs to do as root in terms of opening
specific file descriptors, and then have it drop its privileges.

So the way they are written is quite correct.  And it's consistent
with a device file which is owned by root, mode 600.  A setuid root
program can open the device, but once it is opened, the file
descriptor continues to have access to the program even if its
privileges are dropped, or the file descriptor is passed to another
program.  (This is also sometimes done, deliberately; for example the
original Berkely lpr/lpd program was written where the user would run
lpr, and pass a file descriptor to the lpd daemon, which was not
running as root, but as an unprivileged system process.  This allowed
the lpd daemon to have access to the file, even though it might not be
allowed to open a file that was mode 600.)

The reason why the apm device needed to sample the suser() bit is that
it can be opened by root and non-root processes, but it wanted to
extend the Unix/Linux paradigm that privileges are tested at open()
time.

So this is a not a bug, but quite deliberately, by design.

Regards,

						- Ted
