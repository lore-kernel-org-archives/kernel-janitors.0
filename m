From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 16 Jul 2012 21:01:18 +0000
Subject: Re: [vfs:for-next 92/99] fs/sync.c:79:3: error: too few arguments to function 'writeback_inodes_sb'
Message-Id: <20120716210118.GP31729@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120716095610.GA18633@localhost>
In-Reply-To: <20120716095610.GA18633@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2012 at 05:56:10PM +0800, Fengguang Wu wrote:
> Hi Jan,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
> head:   1073e38331024417f5b0c1fcf7af59b92fb92689
> commit: 2420b4fa98f2cac1e765785f2190b16830d8da4b [92/99] vfs: Reorder operations during sys_sync
> config: i386-randconfig-b001 (attached as .config)

Both this bisect trap and the one reported in the your next mail should've been dealt with
now; new head is 6f27045, when it propagates to git.kernel.org that should be it.
