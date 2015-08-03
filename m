From: David Miller <davem@davemloft.net>
Date: Mon, 03 Aug 2015 22:20:28 +0000
Subject: Re: [patch] rds: fix an integer overflow test in rds_info_getsockopt()
Message-Id: <20150803.152028.229112174649764798.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150801123326.GA5075@mwanda>
In-Reply-To: <20150801123326.GA5075@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: chien.yen@oracle.com, agrover@redhat.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 1 Aug 2015 15:33:26 +0300

> "len" is a signed integer.  We check that len is not negative, so it
> goes from zero to INT_MAX.  PAGE_SIZE is unsigned long so the comparison
> is type promoted to unsigned long.  ULONG_MAX - 4095 is a higher than
> INT_MAX so the condition can never be true.
> 
> I don't know if this is harmful but it seems safe to limit "len" to
> INT_MAX - 4095.
> 
> Fixes: a8c879a7ee98 ('RDS: Info and stats')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
