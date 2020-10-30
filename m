From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 30 Oct 2020 20:59:48 +0000
Subject: Re: [PATCH] ipv6: mcast: make annotations for ip6_mc_msfget() consistent
Message-Id: <20201030135948.32fc1a7c@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028115349.6855-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201028115349.6855-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Wed, 28 Oct 2020 12:53:49 +0100 Lukas Bulwahn wrote:
> Commit 931ca7ab7fe8 ("ip*_mc_gsfget(): lift copyout of struct group_filter
> into callers") adjusted the type annotations for ip6_mc_msfget() at its
> declaration, but missed the type annotations at its definition.
> 
> Hence, sparse complains on ./net/ipv6/mcast.c:
> 
>   mcast.c:550:5: error: symbol 'ip6_mc_msfget' redeclared with different type \
>   (incompatible argument 3 (different address spaces))
> 
> Make ip6_mc_msfget() annotations consistent, which also resolves this
> warning from sparse:
> 
>   mcast.c:607:34: warning: incorrect type in argument 1 (different address spaces)
>   mcast.c:607:34:    expected void [noderef] __user *to
>   mcast.c:607:34:    got struct __kernel_sockaddr_storage *p
> 
> No functional change. No change in object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thank you!
