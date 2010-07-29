From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Jul 2010 23:39:09 +0000
Subject: Re: [Bug] check return of kmalloc()
Message-Id: <20100729233909.GX26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729191557.GA9784@albatros>
In-Reply-To: <20100729191557.GA9784@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org



On Thu, Jul 29, 2010 at 11:15:57PM +0400, Vasiliy Kulikov wrote:
> Hi,
> 
> I've discovered that some btrfs code doesn't check whether kmalloc()
> call succeeded. I poorly understand what this code does and how it can
> be changed, maybe it would be happy with __GFP_NOFAIL.
> 
> Also there are BUG_ON() after kmalloc()'s, if they could be changed not
> to panic it would be great.
> 
> 

Yeah.  That doesn't seem right.

I have pushed a change to smatch to find places like that.  It's valid
to call BUG_ON() for allocation failures during init so the check is
disabled by default.  Use the --spammy option to enable it.

dcarpenter@bicker:~/progs/kernel/devel$ kchecker --spammy fs/btrfs/tree-log.c
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHECK   fs/btrfs/tree-log.c
fs/btrfs/tree-log.c +823 add_inode_ref(43) warn: bug on allocation failure 'name'
fs/btrfs/tree-log.c +868 add_inode_ref(88) warn: bug on allocation failure 'victim_name'
fs/btrfs/tree-log.c +3123 btrfs_recover_log_trees(58) error: 'wc.replay_dest' dereferencing possible ERR_PTR()
  CC [M]  fs/btrfs/tree-log.o
dcarpenter@bicker:~/progs/kernel/devel$ 

regards,
dan carpenter

