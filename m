From: David Miller <davem@davemloft.net>
Date: Thu, 03 Jun 2010 10:29:22 +0000
Subject: Re: [patch] tehuti: return -EFAULT on copy_to_user errors
Message-Id: <20100603.032922.93373171.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603100535.GT5483@bicker>
In-Reply-To: <20100603100535.GT5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: baum@tehutinetworks.net, andy@greyhouse.net, jpirko@redhat.com, shemminger@vyatta.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 3 Jun 2010 12:05:35 +0200

> copy_to_user() returns the number of bytes remaining but we want to
> return a negative error code here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
