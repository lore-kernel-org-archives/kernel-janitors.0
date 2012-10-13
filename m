From: Alasdair G Kergon <agk@redhat.com>
Date: Sat, 13 Oct 2012 00:20:27 +0000
Subject: Re: [dm:for-linus 6/8] WARNING: drivers/md/dm-thin-pool.o(.text+0x53ce): Section mismatch in
Message-Id: <20121013002027.GA5497@agk-dp.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121013000450.GC27431@localhost>
In-Reply-To: <20121013000450.GC27431@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 13, 2012 at 08:04:50AM +0800, Fengguang Wu wrote:
> FYI, there are new compile warnings show up in
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-dm.git for-linus
> head:   dba141601d1327146c84b575bd581ea8730e901c
> commit: 44feb387f6f5584535bd6e3ad7ccfdce715d7dba [6/8] dm thin: prepare to separate bio_prison code
> config: x86_64-allyesconfig # make ARCH=x86_64 
> All warnings:
> 
> WARNING: drivers/md/dm-thin-pool.o(.text+0x53ce): Section mismatch in reference from the function dm_thin_exit() to the function .exit.text:dm_bio_prison_exit()
> The function dm_thin_exit() references a function in an exit section.
> Often the function dm_bio_prison_exit() has valid usage outside the exit section
> and the fix is to remove the __exit annotation of dm_bio_prison_exit.

Actually it's the other way round - dm_thin_exit() should just have __exit added.
Warning disappears with the patch after it and I don't think it's a problem,
but we should clean it up next time anyway.

Alasdair
