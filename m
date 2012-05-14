From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 14 May 2012 08:24:06 +0000
Subject: Re: [patch] netfilter: potential NULL dereference in get_inner_hdr()
Message-Id: <20120514082406.GB9577@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120512110003.GB19472@elgon.mountain>
In-Reply-To: <20120512110003.GB19472@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 12, 2012 at 02:00:03PM +0300, Dan Carpenter wrote:
> There is a typo in the error checking and "&&" was used instead of "||".
> If skb_header_pointer() returns NULL then it leads to a NULL
> dereference.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
