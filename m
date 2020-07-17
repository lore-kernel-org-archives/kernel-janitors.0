From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 17 Jul 2020 06:43:27 +0000
Subject: Re: [PATCH] crypto: xts: use memmove to avoid overlapped memory copy
Message-Id: <20200717064327.GA2504@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716152900.1709694-1-colin.king@canonical.com>
 <CAMj1kXEWyweZ0E3WHthEG9oiOpOS9UxtTB7xskAsF8FeinNg9w@mail.gmail.com>
 <20200717052139.GB2045@gondor.apana.org.au>
 <CAMj1kXH9PHNNUMgwNUv8gBJDxs8w5Eta=AouKM7L=hMWNOQ=HQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH9PHNNUMgwNUv8gBJDxs8w5Eta=AouKM7L=hMWNOQ=HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jul 17, 2020 at 08:59:54AM +0300, Ard Biesheuvel wrote:
>
> Or change it to b[1] = b[0] (assuming the compiler allows struct
> assignment in that way). This will always copy XTS_BLOCK_SIZE bytes,
> but we have sufficient space, and it is probably more efficient  too
> in most cases.

Sounds good to me.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
