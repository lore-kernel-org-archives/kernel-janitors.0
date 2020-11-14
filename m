From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 14 Nov 2020 20:03:10 +0000
Subject: Re: [PATCH] ipv6: remove unused function ipv6_skb_idev()
Message-Id: <20201114120310.0378d56a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113135012.32499-1-lukas.bulwahn@gmail.com>
        <20201113183649.GA1436199@ubuntu-m3-large-x86>
In-Reply-To: <20201113183649.GA1436199@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 13 Nov 2020 11:36:49 -0700 Nathan Chancellor wrote:
> On Fri, Nov 13, 2020 at 02:50:12PM +0100, Lukas Bulwahn wrote:
> > Commit bdb7cc643fc9 ("ipv6: Count interface receive statistics on the
> > ingress netdev") removed all callees for ipv6_skb_idev(). Hence, since
> > then, ipv6_skb_idev() is unused and make CC=clang W=1 warns:
> > 
> >   net/ipv6/exthdrs.c:909:33:
> >     warning: unused function 'ipv6_skb_idev' [-Wunused-function]
> > 
> > So, remove this unused function and a -Wunused-function warning.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>  
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Applied, thanks!
