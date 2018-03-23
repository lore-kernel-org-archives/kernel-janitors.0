From: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 15:06:22 +0000
Subject: Re: [PATCH net-next] ibmvnic: Potential NULL dereference in clean_one_tx_pool()
Message-Id: <5dee3753-8ff3-9e2c-45b5-f5b12db1f722@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323113615.GA28518@mwanda>
In-Reply-To: <20180323113615.GA28518@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: John Allen <jallen@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On 03/23/2018 06:36 AM, Dan Carpenter wrote:
> There is an && vs || typo here, which potentially leads to a NULL
> dereference.

Thanks for catching that!

>
> Fixes: e9e1e97884b7 ("ibmvnic: Update TX pool cleaning routine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 5632c030811b..0389a7a52152 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -1135,7 +1135,7 @@ static void clean_one_tx_pool(struct ibmvnic_adapter *adapter,
>  	u64 tx_entries;
>  	int i;
>
> -	if (!tx_pool && !tx_pool->tx_buff)
> +	if (!tx_pool || !tx_pool->tx_buff)
>  		return;
>
>  	tx_entries = tx_pool->num_buffers;
>

