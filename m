From: Vipin Mehta <vmehta@atheros.com>
Date: Sun, 20 Feb 2011 15:18:34 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <20110220151834.GA5683@vmehta-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
> The original code was written in a funny way where every statement was
> part of else if blocks.  I broke them up into separate statements by
> adding breaks on failure conditions.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/ath6kl/os/linux/ioctl.c b/drivers/staging/ath6kl/os/linux/ioctl.c
> index 5be8ea3..17ba543 100644
> --- a/drivers/staging/ath6kl/os/linux/ioctl.c
> +++ b/drivers/staging/ath6kl/os/linux/ioctl.c
> @@ -3140,29 +3140,31 @@ int ar6000_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>  
>          case AR6000_XIOCTL_OPT_SEND_FRAME:
>          {
> -        WMI_OPT_TX_FRAME_CMD optTxFrmCmd;
> +            WMI_OPT_TX_FRAME_CMD optTxFrmCmd;
>              u8 data[MAX_OPT_DATA_LEN];
>  
>              if (ar->arWmiReady = false) {
>                  ret = -EIO;
> -            } else if (copy_from_user(&optTxFrmCmd, userdata,
> -                                      sizeof(optTxFrmCmd)))
> -            {
> +                break;
> +            }
> +
> +            if (copy_from_user(&optTxFrmCmd, userdata, sizeof(optTxFrmCmd))) {
>                  ret = -EFAULT;
> -            } else if (copy_from_user(data,
> -                                      userdata+sizeof(WMI_OPT_TX_FRAME_CMD)-1,
> -                                      optTxFrmCmd.optIEDataLen))
> -            {
> +                break;
> +            }
> +
> +            if (copy_from_user(data, userdata+sizeof(WMI_OPT_TX_FRAME_CMD) - 1,
> +                                   optTxFrmCmd.optIEDataLen)) {
>                  ret = -EFAULT;
> -            } else {
> -                ret = wmi_opt_tx_frame_cmd(ar->arWmi,
> +                break;
> +            }
> +
> +            ret = wmi_opt_tx_frame_cmd(ar->arWmi,
>                                             optTxFrmCmd.frmType,
>                                             optTxFrmCmd.dstAddr,
>                                             optTxFrmCmd.bssid,
>                                             optTxFrmCmd.optIEDataLen,
>                                             data);
> -            }
> -
>              break;
>          }
>          case AR6000_XIOCTL_WMI_SETRETRYLIMITS:
The cleanup is applicable to the rest of the ar6000_ioctl as well.

Acked-by: Vipin Mehta <vipin.mehta@atheros.com>
