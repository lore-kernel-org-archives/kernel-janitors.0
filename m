From: David Miller <davem@davemloft.net>
Date: Thu, 05 Aug 2010 20:21:55 +0000
Subject: Re: [patch] isdn: fix information leak
Message-Id: <20100805.132155.220076581.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100805093806.GF9031@bicker>
In-Reply-To: <20100805093806.GF9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 5 Aug 2010 11:38:06 +0200

> The main motivation of this patch changing strcpy() to strlcpy().  
> We strcpy() to copy a 48 byte buffers into a 49 byte buffers.  So at
> best the last byte has leaked information, or maybe there is an
> overflow?  Anyway, this patch closes the information leaks by zeroing
> the memory and the calls to strlcpy() prevent overflows. 
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
