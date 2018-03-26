From: David Miller <davem@davemloft.net>
Date: Mon, 26 Mar 2018 01:14:17 +0000
Subject: Re: [PATCH net-next] ibmvnic: Potential NULL dereference in clean_one_tx_pool()
Message-Id: <20180325.211417.809927177270425883.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323113615.GA28518@mwanda>
In-Reply-To: <20180323113615.GA28518@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: benh@kernel.crashing.org, tlfalcon@linux.vnet.ibm.com, jallen@linux.vnet.ibm.com, paulus@samba.org, mpe@ellerman.id.au, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 14:36:15 +0300

> There is an && vs || typo here, which potentially leads to a NULL
> dereference.
> 
> Fixes: e9e1e97884b7 ("ibmvnic: Update TX pool cleaning routine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
