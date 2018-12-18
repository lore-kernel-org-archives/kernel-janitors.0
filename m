From: David Miller <davem@davemloft.net>
Date: Tue, 18 Dec 2018 23:45:04 +0000
Subject: Re: [PATCH net] qed: Fix an error code qed_ll2_start_xmit()
Message-Id: <20181218.154504.355265644967978127.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070513.GD12159@kadam>
In-Reply-To: <20181217070513.GD12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Mintz@kadam, Yuval.Mintz@cavium.com, Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 10:05:13 +0300

> We accidentally deleted the code to set "rc = -ENOMEM;" and this patch
> adds it back.
> 
> Fixes: d2201a21598a ("qed: No need for LL2 frags indication")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
