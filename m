From: David Miller <davem@davemloft.net>
Date: Tue, 15 Dec 2015 17:51:33 +0000
Subject: Re: [patch] mISDN: fix a loop count
Message-Id: <20151215.125133.1380311053547267182.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151215100752.GC20848@mwanda>
In-Reply-To: <20151215100752.GC20848@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, arnd@arndb.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 13:07:52 +0300

> There are two issue here.
> 1)  cnt starts as maxloop + 1 so all these loops iterate one more time
>     than intended.
> 2)  At the end of the loop we test for "if (maxloop && !cnt)" but for
>     the first two loops, we end with cnt equal to -1.  Changing this to
>     a pre-op means we end with cnt set to 0.
> 
> Fixes: cae86d4a4e56 ('mISDN: Add driver for Infineon ISDN chipset family')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
