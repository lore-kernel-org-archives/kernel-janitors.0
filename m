From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 02:21:41 +0000
Subject: Re: [patch] crypto/ablkcipher: missing return statement
Message-Id: <20100715.192141.242121343.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100715075736.GC5164@bicker>
In-Reply-To: <20100715075736.GC5164@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: herbert@gondor.apana.org.au, richih.mailinglist@gmail.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 15 Jul 2010 09:57:36 +0200

> The intent was to return here.  In the original an allocation failure
> would lead to a NULL dereference.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: David S. Miller <davem@davemloft.net>
