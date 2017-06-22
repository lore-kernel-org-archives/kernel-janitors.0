From: Samuel Ortiz <sameo@linux.intel.com>
Date: Thu, 22 Jun 2017 22:47:57 +0000
Subject: Re: [PATCH] NFC: nci: Remove an unneeded NULL check
Message-Id: <20170622224757.GJ21214@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614074945.GA29233@elgon.mountain>
In-Reply-To: <20170614074945.GA29233@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christophe Ricard <christophe.ricard@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Jun 14, 2017 at 10:49:46AM +0300, Dan Carpenter wrote:
> "conn_info" can't be NULL here.  Also we just dereferenced it a couple
> lines earlier, so that makes static checkers complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
> index 61fff422424f..5542fc72f020 100644
> --- a/net/nfc/nci/core.c
> +++ b/net/nfc/nci/core.c
> @@ -73,11 +73,9 @@ int nci_get_conn_info_by_dest_type_params(struct nci_dev *ndev, u8 dest_type,
>  		if (conn_info->dest_type = dest_type) {
>  			if (!params)
>  				return conn_info->conn_id;
> -			if (conn_info) {
> -				if (params->id = conn_info->dest_params->id &&
> -				    params->protocol = conn_info->dest_params->protocol)
> -					return conn_info->conn_id;
> -			}
> +			if (params->id = conn_info->dest_params->id &&
> +			    params->protocol = conn_info->dest_params->protocol)
> +				return conn_info->conn_id;
A similar patch was sent earlier and is now applied:
https://git.kernel.org/pub/scm/linux/kernel/git/sameo/nfc-next.git/commit/?id036184e9d4a5b2b42a70b66db9455808dd5da9

Cheers,
Samuel.

