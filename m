From: Florian Westphal <fw@strlen.de>
Date: Wed, 12 Jun 2019 10:40:19 +0000
Subject: Re: [PATCH][next] xfrm: fix missing break on AF_INET6 case
Message-Id: <20190612104019.2f6x72wa2qdxw5p3@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190612103624.27246-1-colin.king@canonical.com>
In-Reply-To: <20190612103624.27246-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Westphal <fw@strlen.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It appears that there is a missing break statement for the AF_INET6 case
> that falls through to the default WARN_ONCE case. I don't think that is
> intentional. Fix this by adding in the missing break.

Yes, I sent same patch a few minutes ago:

https://patchwork.ozlabs.org/patch/1114377/

I don't mind which one gets applied.
