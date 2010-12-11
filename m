From: Dan Carpenter <error27@gmail.com>
Date: Sat, 11 Dec 2010 05:07:20 +0000
Subject: Re: [patch] isdn: return -EFAULT if copy_from_user() fails
Message-Id: <20101211050720.GF10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101211014154.3157588b@absol.kitzblitz>
 <20101210.164721.85429801.davem@davemloft.net>
 <20101210.165003.267942493.davem@davemloft.net>
 <20101210.165259.22054320.davem@davemloft.net>
In-Reply-To: <20101210.165259.22054320.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: nikai@nikai.net, isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> >>> Ahem, we're printing this return value:
> >>> 

Doh!  Thanks for that guys.

regards,
dan carpenter
