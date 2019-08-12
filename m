From: David Miller <davem@davemloft.net>
Date: Mon, 12 Aug 2019 04:22:22 +0000
Subject: Re: [PATCH][net-next] rxrpc: fix uninitialized return value in variable err
Message-Id: <20190811.212222.1922285162572379435.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809170259.29859-1-colin.king@canonical.com>
In-Reply-To: <20190809170259.29859-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  9 Aug 2019 18:02:59 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit removed the setting of err to -ENOMEM so currently
> the skb_shinfo(skb)->nr_frags > 16 check returns with an uninitialized
> bogus return code.  Fix this by setting err to -ENOMEM to restore
> the original behaviour.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

David, I assume you will pick this up.
