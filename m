From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Dec 2019 07:56:36 +0000
Subject: A couple TODO ideas
Message-Id: <20191206075636.GI1765@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sudip and I have started a #syzkaller channel on OFTC irc.  The idea is
that if people are working on bugs from the syzbot dashboard and run
into any issues or have questions they could ask them their.

Another idea that is that someone could write a scripts/email_patch.sh
script.  You could either give it a just a <commit id> or a <start> and
<end> commit id.  Maybe there would be a --to=<email@address.com> option
but by default it would just use get_maintainer.pl.

It would be an interactive script for first timers.  It would do some
QC like trying to run checkpatch and Sparse with --endian flags.  Stuff
like looking at the patch prefix.  Here is what I use to send my
patches.

https://repo.or.cz/smatch.git/blob/HEAD:/smatch_scripts/kpatch.sh

regards,
dan caprenter
