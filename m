From: Christophe RICARD <christophe.ricard@gmail.com>
Date: Sat, 09 Aug 2014 21:49:03 +0000
Subject: Re: [patch] NFC: st21nfcb: double free on allocation error
Message-Id: <20140809234903.030b479f@toffy-MacBookPro>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

A patch fixing this issue got already sent to the linux-nfc mailing
list.
Here is a pointer to the patch:
https://lists.01.org/pipermail/linux-nfc/2014-July/002647.html

You are welcome to comment if anything is wrong.

Best Regards
Christophe
On Thu, 31 Jul 2014 12:41:23 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "info" is allocated with devm_kzalloc() so calling kfree() here will
> lead to a double free.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/nfc/st21nfcb/st21nfcb.c
> b/drivers/nfc/st21nfcb/st21nfcb.c index 4d95863..6944f9e 100644
> --- a/drivers/nfc/st21nfcb/st21nfcb.c
> +++ b/drivers/nfc/st21nfcb/st21nfcb.c
> @@ -94,8 +94,7 @@ int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int
> phy_headroom, phy_headroom, phy_tailroom);
>  	if (!ndlc->ndev) {
>  		pr_err("Cannot allocate nfc ndev\n");
> -		r = -ENOMEM;
> -		goto err_alloc_ndev;
> +		return -ENOMEM;
>  	}
>  	info->ndlc = ndlc;
>  
> @@ -109,8 +108,6 @@ int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int
> phy_headroom, err_regdev:
>  	nci_free_device(ndlc->ndev);
>  
> -err_alloc_ndev:
> -	kfree(info);
>  	return r;
>  }
>  EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);

