From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Sep 2012 14:29:26 +0000
Subject: Re: smatch warnings in current upstream kernel
Message-Id: <20120911142926.GW19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911105127.GD19410@mwanda>
In-Reply-To: <20120911105127.GD19410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 11, 2012 at 07:06:40PM +0800, Fengguang Wu wrote:
> On Tue, Sep 11, 2012 at 01:51:27PM +0300, Dan Carpenter wrote:
>
> $SMATCH -p kernel "$@" > $SMATCH_OUT_ROOT/$PPID-$$-$RANDOM

Some of the warnings you are getting seem to mean that you're not
picking up the smatch_data/ directory.  For example some of the
buffer overflow errors:

drivers/mtd/ubi/wl.c:336 prot_queue_add() warn: buffer overflow 'ubi->pq' 10 <= 10

What is happening in that function is that Smatch sees the:
	ubi_assert(pq_tail >= 0 && pq_tail < UBI_PROT_QUEUE_LEN);

and assumes that since there is a test for
"pq_tail < UBI_PROT_QUEUE_LEN" then it must be possible for
pq_tail = UBI_PROT_QUEUE_LEN.  There is a file called:
smatch_data/kernel.ignored_macros which has ubi_assert() and it
means to ignore everything that happens inside a ubi_assert().

Normally Smatch looks for the data dir with the binary, but you can
also specify a directory with --data=/path/to/smatch_data/.  Then
you can test that it's working by doing a:
	kchecker drivers/mtd/ubi/wl.c
to verify that the warning goes away.

It may cause a lot of new warnings to show up though...

regards,
dan carpenter
