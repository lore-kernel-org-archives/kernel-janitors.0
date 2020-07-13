From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 13 Jul 2020 19:30:43 +0000
Subject: Re: [PATCH 1/2] Crypto/chcr: Avoid some code duplication
Message-Id: <2cb65b54-5be0-7fab-546d-e7fc33621c7f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200712211404.276211-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200712211404.276211-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Rohit Maheshwari <rohitm@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>

> The error handling path of 'chcr_authenc_setkey()' is the same as this
> error handling code.

I find this change description improvable.


> So just 'goto out' as done everywhere in the function to simplify the code.

I propose to adjust jump targets a bit more for better exception handling
in this function implementation.

Regards,
Markus
