From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 10 Jul 2017 09:56:45 +0000
Subject: Re: [PATCH 2/2 net] cxgb4: ptp_clock_register() returns error pointers
Message-Id: <20170710095645.sqyl2i5de3duxxtl@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
 <20170710071615.k6b6726cwushhdmm@mwanda>
In-Reply-To: <20170710071615.k6b6726cwushhdmm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ganesh Goudar <ganeshgr@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2017 at 10:16:15AM +0300, Dan Carpenter wrote:
> We're checking ptp_clock_register() for NULL but we should be checking
> for error pointers.

No.

> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
> index 50517cfd9671..c24313a103c6 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
> @@ -441,7 +441,7 @@ void cxgb4_ptp_init(struct adapter *adapter)
>  
>  	adapter->ptp_clock = ptp_clock_register(&adapter->ptp_clock_info,
>  						&adapter->pdev->dev);
> -	if (!adapter->ptp_clock) {

Yeah, that is wrong, but the fix is to check to IS_ERR or NULL.

Thanks,
Richard
