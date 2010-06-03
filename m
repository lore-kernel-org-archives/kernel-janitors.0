From: David Miller <davem@davemloft.net>
Date: Thu, 03 Jun 2010 10:29:16 +0000
Subject: Re: [patch] isdn/kcapi: return -EFAULT on copy_from_user errors
Message-Id: <20100603.032916.267394338.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603095613.GP5483@bicker>
In-Reply-To: <20100603095613.GP5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, jan.kiszka@web.de, tilman@imap.cc, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 3 Jun 2010 11:56:13 +0200

> copy_from_user() returns the number of bytes remaining but we should
> return -EFAULT here.  The error code gets returned to the user.  Both 
> old_capi_manufacturer() and capi20_manufacturer() had other places
> that already returned -EFAULT so this won't break anything.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
