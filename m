From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Mon, 23 Oct 2017 11:21:07 +0000
Subject: Re: [PATCH] esp6: remove redundant initialization of esph
Message-Id: <20171023112107.GG3323@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171019130947.30950-1-colin.king@canonical.com>
In-Reply-To: <20171019130947.30950-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 19, 2017 at 03:09:47PM +0200, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer esph is being initialized with a value that is never
> read and then being updated.  Remove the redundant initialization
> and move the declaration and initializtion of esph to the local
> code block.
> 
> Cleans up clang warning:
> net/ipv6/esp6.c:562:21: warning: Value stored to 'esph' during its
> initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to ipsec-next, thanks!
