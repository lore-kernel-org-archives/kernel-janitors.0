From: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 03 Dec 2020 18:55:47 +0000
Subject: Re: [PATCH net] chelsio/chtls: fix a double free in chtls_setkey()
Message-Id: <20201203105547.13364c00@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ilb6PtBRLWiSHp@mwanda>
In-Reply-To: <X8ilb6PtBRLWiSHp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 3 Dec 2020 11:44:31 +0300 Dan Carpenter wrote:
> The "skb" is freed by the transmit code in cxgb4_ofld_send() and we
> shouldn't use it again.  But in the current code, if we hit an error
> later on in the function then the clean up code will call kfree_skb(skb)
> and so it causes a double free.
> 
> Set the "skb" to NULL and that makes the kfree_skb() a no-op.
> 
> Fixes: d25f2f71f653 ("crypto: chtls - Program the TLS session Key")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
