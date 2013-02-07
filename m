From: Szymon Janc <szymon.janc@tieto.com>
Date: Thu, 07 Feb 2013 10:16:01 +0000
Subject: Re: [patch] NFC: llcp: integer underflow in nfc_llcp_set_remote_gb()
Message-Id: <2148581.S8tzak9aE2@uw000953>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130131081645.GA14812@elgon.mountain>
In-Reply-To: <20130131081645.GA14812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Thierry Escande <thierry.escande@linux.intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-nfc@ml01.01.org" <linux-nfc@ml01.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

On Thursday 31 of January 2013 10:16:46 Dan Carpenter wrote:
> If gb_len is less than 3 it would cause an integer underflow and
> possibly memory corruption in nfc_llcp_parse_gb_tlv().
> 
> I removed the old test for gb_len = 0.  I also removed the test for
> ->remote_gb = NULL.  It's not possible for ->remote_gb to be NULL and
> we have already dereferenced ->remote_gb_len so it's too late to test.
> 
> The old test return -ENODEV but my test returns -EINVAL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/nfc/llcp/llcp.c b/net/nfc/llcp/llcp.c
> index 85bc75c..746f5a2 100644
> --- a/net/nfc/llcp/llcp.c
> +++ b/net/nfc/llcp/llcp.c
> @@ -549,14 +549,13 @@ int nfc_llcp_set_remote_gb(struct nfc_dev *dev, u8 *gb, u8 gb_len)
>  		pr_err("No LLCP device\n");
>  		return -ENODEV;
>  	}
> +	if (gb_len < 3)
> +		return -EINVAL;

Maybe define NFC_MIN_GT_LEN and test it together with NFC_MAX_GT_LEN in
nfc_set_remote_general_bytes() ?

>  
>  	memset(local->remote_gb, 0, NFC_MAX_GT_LEN);
>  	memcpy(local->remote_gb, gb, gb_len);
>  	local->remote_gb_len = gb_len;
>  
> -	if (local->remote_gb = NULL || local->remote_gb_len = 0)
> -		return -ENODEV;
> -
>  	if (memcmp(local->remote_gb, llcp_magic, 3)) {
>  		pr_err("MAC does not support LLCP\n");
>  		return -EINVAL;

-- 
BR
Szymon Janc
