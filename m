From: David Miller <davem@davemloft.net>
Date: Thu, 09 Jan 2020 00:04:05 +0000
Subject: Re: [PATCH] ethtool: potential NULL dereference in strset_prepare_data()
Message-Id: <20200108.160405.1403964084544750153.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108054236.ult5qxiiwpw2wamk@kili.mountain>
In-Reply-To: <20200108054236.ult5qxiiwpw2wamk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mkubecek@suse.cz, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Jan 2020 08:42:36 +0300

> Smatch complains that the NULL checking isn't done consistently:
> 
>     net/ethtool/strset.c:253 strset_prepare_data()
>     error: we previously assumed 'dev' could be null (see line 233)
> 
> It looks like there is a missing return on this path.
> 
> Fixes: 71921690f974 ("ethtool: provide string sets with STRSET_GET request")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
