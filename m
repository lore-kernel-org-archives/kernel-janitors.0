From: Michel Lespinasse <walken@google.com>
Date: Tue, 07 Aug 2012 03:08:20 +0000
Subject: Re: [next:akpm 34/51] fs/gfs2/rgrp.c:456:2: error: implicit declaration of function 'rb_init_node'
Message-Id: <CANN689F+ML8qNvZTkcT0VxoQ-k_Zi1vX8C5L9ogMWWLboqszyQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120807030222.GA22040@localhost>
In-Reply-To: <20120807030222.GA22040@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 6, 2012 at 8:02 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Michel,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   429a0cb2da6bd3fc09e42eb45ed15bf2994354a8
> commit: 5599fe1ab023aed6c8b15adf4a91c02b74224194 [34/51] rbtree: empty nodes have no color
> config: i386-randconfig-k627 (attached as .config)
>
> All related error/warning messages:
>
> fs/gfs2/rgrp.c: In function 'gfs2_rs_alloc':
> fs/gfs2/rgrp.c:456:2: error: implicit declaration of function 'rb_init_node' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Yes. There is a fix pending in gfs2 tree. In this case, rb_init_node()
needs to be replaced with RB_CLEAR_NODE().

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
