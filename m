From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Aug 2020 11:12:59 +0000
Subject: Re: [PATCH] staging: rtl8192e: fix missing failure check on a call to dev_alloc_name
Message-Id: <20200824111258.GE1793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200821131512.348775-1-colin.king@canonical.com>
In-Reply-To: <20200821131512.348775-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Mike McCormack <mikem@ring3k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wlanfae <wlanfae@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>

On Fri, Aug 21, 2020 at 02:15:12PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the second call to dev_alloc_name is not checking if this
> failed.  Add the check and perform necessary cleanup on an error.
> 
> Addresses-Coverity: ("Unchecked return value")
> Fixes: 94a799425eee ("rtl8192e: Import new version of driver from realtek")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index fac58eebf263..7b15faeefff2 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -2489,7 +2489,8 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
>  	if (dev_alloc_name(dev, ifname) < 0) {
                                ^^^^^^

>  		RT_TRACE(COMP_INIT,
>  			 "Oops: devname already taken! Trying wlan%%d...\n");
                                                              ^^^^^^^

> -		dev_alloc_name(dev, ifname);
                                    ^^^^^^
> +		if (dev_alloc_name(dev, ifname) < 0)

The "ifname" is wrong.  It was intended to be "wlan%d" or something like
the comment says.  It will always fail.  One potential is to just delete
this retest and assume that the user will fix their mistake and try
again.  That's probably the best solution in fact.

> +			goto err_unmap;
>  	}

	if (dev_alloc_name(dev, ifname) < 0) {
		RT_TRACE(COMP_INIT, "Oops: devname failed '%s'!\n", ifname);
		goto err_unmap;
	}

>  
>  	RT_TRACE(COMP_INIT, "Driver probe completed1\n");

regards,
dan carpenter
