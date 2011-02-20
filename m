From: Vipin Mehta <vmehta@atheros.com>
Date: Sun, 20 Feb 2011 15:18:53 +0000
Subject: Re: [patch 2/2] staging: ath6kl: buffer overflow in SEND_FRAME
Message-Id: <20110220151853.GB5683@vmehta-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124953.GB1898@bicker>
In-Reply-To: <20110220124953.GB1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 04:49:53AM -0800, Dan Carpenter wrote:
> We should check that optTxFrmCmd.optIEDataLen isn't too large before we
> copy it into the data buffer.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/ath6kl/os/linux/ioctl.c b/drivers/staging/ath6kl/os/linux/ioctl.c
> index 17ba543..9a9a324 100644
> --- a/drivers/staging/ath6kl/os/linux/ioctl.c
> +++ b/drivers/staging/ath6kl/os/linux/ioctl.c
> @@ -3153,6 +3153,11 @@ int ar6000_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>                  break;
>              }
>  
> +            if (optTxFrmCmd.optIEDataLen > MAX_OPT_DATA_LEN) {
> +                ret = -EINVAL;
> +                break;
> +            }
> +
>              if (copy_from_user(data, userdata+sizeof(WMI_OPT_TX_FRAME_CMD) - 1,
>                                     optTxFrmCmd.optIEDataLen)) {
>                  ret = -EFAULT;
Acked-by: Vipin Mehta <vipin.mehta@atheros.com>
