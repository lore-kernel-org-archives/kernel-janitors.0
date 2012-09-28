From: Michel Lespinasse <walken@google.com>
Date: Fri, 28 Sep 2012 22:36:35 +0000
Subject: Re: [next:akpm 140/423] fs/block_dev.c:135:2: error: implicit declaration of function 'prio_tree_emp
Message-Id: <CANN689F6AgeKKhumHJNvHtpBgC2_rMPHSJQZLWS=Ju4W3KzQhg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928100833.GB29414@localhost>
In-Reply-To: <20120928100833.GB29414@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2012 at 3:08 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Michel,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   b97e42d4aec6640aeb2a0347d9d40d12db17ded9
> commit: f7d8d6b34e1d98650967ef035824beabec51019d [140/423] mm: replace vma prio_tree with an interval tree
> config: x86_64-allmodconfig
>
> All error/warnings:
>
> fs/block_dev.c: In function 'set_blocksize':
> fs/block_dev.c:135:2: error: implicit declaration of function 'prio_tree_empty' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Yes, Stephen Rothwell posted a fix for this in LKML (use RB_EMPTY_ROOT
instead of prio_tree_empty)

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
