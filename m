From: David Miller <davem@davemloft.net>
Date: Tue, 07 Feb 2017 19:00:50 +0000
Subject: Re: [patch v2 net-next] sfc: fix an off by one bug
Message-Id: <20170207.140050.1152060406801498921.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <60d163b6-0b49-172f-288c-e1712e04a84e@solarflare.com>
        <20170207074431.GA18377@mwanda>
In-Reply-To: <20170207074431.GA18377@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Feb 2017 10:44:31 +0300

> This bug is harmless because it's just a sanity check and we always
> pass valid values for "encap_type" but the test is off by one.
> 
> Fixes: 9b4108012517 ("sfc: insert catch-all filters for encapsulated traffic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Rebased against last linux-next

Applied, thanks Dan.
