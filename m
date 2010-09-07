From: David Miller <davem@davemloft.net>
Date: Tue, 07 Sep 2010 01:30:25 +0000
Subject: Re: [patch] isdn: potential buffer overflows
Message-Id: <20100906.183025.02291340.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100904183806.GO5437@bicker>
In-Reply-To: <20100904183806.GO5437@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 4 Sep 2010 20:38:59 +0200

> cs->ics.parm.setup.phone is a 32 character array.  In each of these
> cases we're copying from a 35 character array into a 32 character array
> so we should use strlcpy() instead of strcpy().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
