From: Or Gerlitz <gerlitz.or@gmail.com>
Date: Sun, 21 Oct 2018 10:56:26 +0000
Subject: Re: [PATCH] net/mlx5: allocate enough space in
Message-Id: <CAJ3xEMjZ8WQu2cj_QgU9RoZvUZu7X2Szh6-Si6KZU-qMBFqwHQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019200638.dea3r4uocbij6d6j@kili.mountain> <CAJ3xEMhwcYYDWWLropG95T6TyE62OfJS+oPAFDZKLOVJSurNRQ@mail.gmail.com>
In-Reply-To: <CAJ3xEMhwcYYDWWLropG95T6TyE62OfJS+oPAFDZKLOVJSurNRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Paul Blakey <paulb@mellanox.com>, kernel-janitors@vger.kernel.org, Linux Netdev List <netdev@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>

On Sat, Oct 20, 2018 at 11:37 PM Or Gerlitz <gerlitz.or@gmail.com> wrote:
> On Fri, Oct 19, 2018 at 11:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > FDB_MAX_CHAIN is 3.  We wanted to allocate enough memory to hold four
> > structs but there are missing parentheses so we only allocate enough
> > memory for three structs and the first byte of the fourth one.
>
> yeah, seems that we were wrong here and the fix is correct, at some
> point I saw Kasan screams but it was gone later, let me look, thanks for pointing it out.

OK, here's the kasan note:

[  289.005141] BUG: KASAN: slab-out-of-bounds in
mlx5_init_fs+0x6a7/0x1176 [mlx5_core]
[  289.005244] Write of size 8 at addr ffff8806cfb70e58 by task modprobe/6186

my .config was like this w.r.t kasan:

CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_KASAN=y
# CONFIG_KASAN_EXTRA is not set
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
# CONFIG_TEST_KASAN is not set

where now, when I changed it to be:

CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_KASAN=y
CONFIG_KASAN_EXTRA=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
# CONFIG_TEST_KASAN is not set

Kasan is there to spot the bug.

I will re-post your patch, this time to netdev since the original
commit is there
and so should be the fix, thanks for reporting/fixing!

Or.
