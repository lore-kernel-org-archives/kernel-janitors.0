From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jan 2016 20:08:06 +0000
Subject: Re: [patch -next] mlxsw: core: remove an unnecessary condition
Message-Id: <20160106.150806.1402674809005659001.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106095630.GB23185@mwanda>
In-Reply-To: <20160106095630.GB23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Jan 2016 12:56:30 +0300

> We checked "err" on the lines before so we know it's zero here.
> 
> These cause a static checker warning because checking known things can
> indicate a bug.  Maybe there is a missing assignment or we are checking
> the wrong variable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
