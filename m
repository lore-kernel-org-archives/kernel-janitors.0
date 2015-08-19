From: David Miller <davem@davemloft.net>
Date: Wed, 19 Aug 2015 02:07:21 +0000
Subject: Re: [patch] cxgb4: memory corruption in debugfs
Message-Id: <20150818.190721.630738689965121571.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150818093144.GG3965@mwanda>
In-Reply-To: <20150818093144.GG3965@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Aug 2015 12:31:44 +0300

> You can't use kstrtoul() with an int or it causes memory corruption.
> Also j should be unsigned or we have underflow bugs.
> 
> I considered changing "j" to unsigned long but everything fits in a u32.
> 
> Fixes: 8e3d04fd7d70 ('cxgb4: Add MPS tracing support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
