From: ebiederm@xmission.com (Eric W. Biederman)
Date: Sun, 14 Oct 2012 02:37:56 +0000
Subject: Re: [userns:userns-always-map-user-v68 15/81] fs/btrfs/tree-log.c:2955:2: error: incompatible type f
Message-Id: <87a9vpkccb.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121014023152.GC6795@localhost>
In-Reply-To: <20121014023152.GC6795@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v68
> head:   500247cbddef8c9667eaf908dd2341c0edd05ad4
> commit: 7d7f64034e5b2b4f30e05511925bf7487dd1d93f [15/81] userns: Now that everything has been converted remove the unnecessary infrastructure
> config: x86_64-randconfig-s042 (attached as .config)

Thanks.

I somehow failed to move the fix to the top of my tree before I
pushed out the branch.

There is a fix for this at the end of my branch and merged into Linus's tree.

Eric
