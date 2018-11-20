From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Tue, 20 Nov 2018 07:34:43 +0000
Subject: Re: [PATCH] af_key: fix indentation on declaration statement
Message-Id: <20181120073443.GB3581@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181113142328.8322-1-colin.king@canonical.com>
In-Reply-To: <20181113142328.8322-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 13, 2018 at 02:23:28PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an indentation issue before the declaration of xfrm_ctx. Remove
> spaces and replace with a tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to ipsec-next.
