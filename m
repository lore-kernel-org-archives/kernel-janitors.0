From: Joe Perches <joe@perches.com>
Date: Sat, 09 May 2020 23:41:30 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <1870db200ffa03e3fce935b5e35e4562989d2dcf.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50ef36cd-d095-9abe-26ea-d363d11ce521@wanadoo.fr>
         <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
         <fc5cf8da8e70ebb981a9fc3aec6834c74197f0ed.camel@perches.com>
         <20200509.163217.1372289149714306397.davem@davemloft.net>
In-Reply-To: <20200509.163217.1372289149714306397.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: kuba@kernel.org, christophe.jaillet@wanadoo.fr, fthain@telegraphics.com.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2020-05-09 at 16:32 -0700, David Miller wrote:
> From: Joe Perches <joe@perches.com>
> Date: Sat, 09 May 2020 15:42:36 -0700
> 
> > David, maybe I missed some notification about Jakub's role.
> > 
> > What is Jakub's role in relation to the networking tree?
> 
> He is the co-maintainer of the networking tree and you should respect
> his actions and feedback as if it were coming from me.

If he's committing drivers then presumably then
he should be added to this section as well.

NETWORKING DRIVERS
M:	"David S. Miller" <davem@davemloft.net>
L:	netdev@vger.kernel.org
S:	Odd Fixes
