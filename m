From: David Miller <davem@davemloft.net>
Date: Sun, 02 Sep 2012 02:46:13 +0000
Subject: Re: [patch] fddi: 64 bit bug in smt_add_para()
Message-Id: <20120901.224613.2151709083178612132.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120901195740.GG20741@mwanda>
In-Reply-To: <20120901195740.GG20741@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 1 Sep 2012 12:57:40 -0700

> The intent was to set 4 bytes of data so that's why the sp_len is set
> to 4 on the next line.  The cast to u_long pointer clears 8 bytes
> on 64 bit arches.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Obvious enough, applied, thanks Dan.
