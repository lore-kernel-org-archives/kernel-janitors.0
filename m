From: Peter Jones <pjones@redhat.com>
Date: Fri, 11 Jan 2013 14:52:56 +0000
Subject: Re: [patch] ibft: add a missing break statement
Message-Id: <20130111145256.GA14496@fenchurch.internal.datastacks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130111064807.GA13207@elgon.mountain>
In-Reply-To: <20130111064807.GA13207@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 11, 2013 at 09:48:07AM +0300, Dan Carpenter wrote:
> The code works the same with or without the break.  It just looks a bit
> cleaner to not fall through.

Yeah, you're clearly right.

For those reading this, so you don't have to go check yourselves, the
line after the end of this diff is also a break; there's no further code
in that case.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Peter Jones <pjones@redhat.com>

> 
> diff --git a/drivers/firmware/iscsi_ibft.c b/drivers/firmware/iscsi_ibft.c
> index 3ee852c..c4b187c 100644
> --- a/drivers/firmware/iscsi_ibft.c
> +++ b/drivers/firmware/iscsi_ibft.c
> @@ -503,6 +503,7 @@ static umode_t __init ibft_check_tgt_for(void *data, int type)
>  	case ISCSI_BOOT_TGT_NIC_ASSOC:
>  	case ISCSI_BOOT_TGT_CHAP_TYPE:
>  		rc = S_IRUGO;
> +		break;
>  	case ISCSI_BOOT_TGT_NAME:
>  		if (tgt->tgt_name_len)
>  			rc = S_IRUGO;

-- 
        Peter
