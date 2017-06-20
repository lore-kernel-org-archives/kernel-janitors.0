From: David Miller <davem@davemloft.net>
Date: Tue, 20 Jun 2017 15:59:31 +0000
Subject: Re: [PATCH] crypto: cavium: make several functions static
Message-Id: <20170620.115931.349171159880534656.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170620103550.7660-1-colin.king@canonical.com>
In-Reply-To: <20170620103550.7660-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: george.cherian@cavium.com, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Jun 2017 11:35:50 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions cvm_encrypt, cvm_decrypt, cvm_xts_setkey and
> cvm_enc_dec_init does not need to be in global scope, so make
> them static.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: David S. Miller <davem@davemloft.net>
