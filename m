From: David Miller <davem@davemloft.net>
Date: Thu, 22 Jul 2010 21:11:45 +0000
Subject: Re: [PATCH] 3c59x: handle pci_iomap() errors
Message-Id: <20100722.141145.116647591.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279713638-31567-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279713638-31567-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, klassert@mathematik.tu-chemnitz.de, eric.dumazet@gmail.com, ben@decadent.org.uk, adobriyan@gmail.com, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 21 Jul 2010 16:00:36 +0400

> pci_iomap() can fail, handle this case and return -ENOMEM from probe
> function.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.

We seem to leak the iomaps if vortex_probe1() fails, feel free to fix
that too :-)
