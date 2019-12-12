From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 19:06:50 +0000
Subject: Re: [PATCH net-next] net: Remove unused including <linux/version.h>
Message-Id: <CAHmME9osYEbi1BDmJL=4N+A1rbb7_MPqVijogHSFhU39rRCbdw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212091527.35293-1-yuehaibing@huawei.com> <20191212.105258.579549471896891617.davem@davemloft.net>
In-Reply-To: <20191212.105258.579549471896891617.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, WireGuard mailing list <wireguard@lists.zx2c4.com>, Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dave,

On Thu, Dec 12, 2019 at 7:53 PM David Miller <davem@davemloft.net> wrote:
>
> From: YueHaibing <yuehaibing@huawei.com>
> Date: Thu, 12 Dec 2019 09:15:27 +0000
>
> > Remove including <linux/version.h> that don't need it.
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> Appropriate subject line for this should have been:
>
>         Subject: [PATCH net-next] wireguard: Remove unused include <linux/version.h>
>
> 'net' is too broad a subsystem prefix as it basically encompases half of the
> entire kernel tree.  When people look at the git shortlog output you need to
> be specific enough that people can tell what touches what.

I have these fixed up how you like in the wireguard-linux.git repo,
and I'll submit these in a series to net-next next week all together.

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/log

Jason
