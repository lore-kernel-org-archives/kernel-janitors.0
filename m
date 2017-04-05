From: David Miller <davem@davemloft.net>
Date: Wed, 05 Apr 2017 13:54:35 +0000
Subject: Re: [PATCH -next] qed: Add a missing error code
Message-Id: <20170405.065435.2136737390754015809.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403182522.GA32592@mwanda>
In-Reply-To: <20170403182522.GA32592@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@cavium.com, Tomer.Tayar@cavium.com, Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 3 Apr 2017 21:25:22 +0300

> We should be returning -ENOMEM if qed_mcp_cmd_add_elem() fails.  The
> current code returns success.
> 
> Fixes: 4ed1eea82a21 ("qed: Revise MFW command locking")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
