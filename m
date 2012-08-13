From: Josef Bacik <jbacik@fusionio.com>
Date: Mon, 13 Aug 2012 15:33:27 +0000
Subject: Re: [josef-btrfs:extent-history 20/20] fs/btrfs/delayed-ref.h:125:21: error: field 'trace' has incom
Message-Id: <20120813153327.GA2133@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120810082047.GA26352@localhost>
In-Reply-To: <20120810082047.GA26352@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Josef Bacik <JBacik@fusionio.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>

On Fri, Aug 10, 2012 at 02:20:47AM -0600, Fengguang Wu wrote:
> Hi Josef,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git extent-history
> head:   7759db1867be3d642b2411455902ed22dd6d1381
> commit: 7759db1867be3d642b2411455902ed22dd6d1381 [20/20] Btrfs: extent history debugging patch
> config: i386-randconfig-k662 (attached as .config)
> 

This is just a debug patch that's just up so other people can use it in the
future.  But looks like we just need a CONFIG_STACKTRACE check so I've added
that and hopefully that fixed it.  Thanks,

Josef
