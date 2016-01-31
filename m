From: Stephan Mueller <smueller@chronox.de>
Date: Sun, 31 Jan 2016 13:00:16 +0000
Subject: Re: [patch] crypto: keywrap - memzero the correct memory
Message-Id: <7459893.TVu3jshKD9@positron.chronox.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160130143828.GC3462@mwanda>
In-Reply-To: <20160130143828.GC3462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Samstag, 30. Januar 2016, 17:38:28 schrieb Dan Carpenter:

Hi Dan,

> We're clearing the wrong memory.  The memory corruption is likely
> harmless because we weren't going to use that stack memory again but not
> zeroing is a potential information leak.
> 
> Fixes: e28facde3c39 ('crypto: keywrap - add key wrapping block chaining
> mode') Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Stephan Mueller <smueller@chronox.de>

Thanks
Stephan
