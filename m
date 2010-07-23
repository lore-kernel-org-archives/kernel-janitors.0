From: David Miller <davem@davemloft.net>
Date: Fri, 23 Jul 2010 20:06:13 +0000
Subject: Re: [PATCH] net: 3c59x: fix leak of iomaps
Message-Id: <20100723.130613.242150222.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279903485-28247-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279903485-28247-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, klassert@mathematik.tu-chemnitz.de, eric.dumazet@gmail.com, ben@decadent.org.uk, adobriyan@gmail.com, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 23 Jul 2010 20:44:44 +0400

> If vortex_probe1() fails we should unmap ioaddr mapped earlier.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.  Thanks for following up on this.
