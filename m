From: David Miller <davem@davemloft.net>
Date: Mon, 10 Aug 2015 21:27:14 +0000
Subject: Re: [patch 1/2 -mainline] cxgb4: missing curly braces in t4_setup_debugfs()
Message-Id: <20150810.142714.1369087190107952860.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150808191525.GB8034@mwanda>
In-Reply-To: <20150808191525.GB8034@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 8 Aug 2015 22:15:25 +0300

> There were missing curly braces so it means we call add_debugfs_mem()
> unintentionally.
> 
> Fixes: 3ccc6cf74d8c ('cxgb4: Adds support for T6 adapter')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to 'net'.
