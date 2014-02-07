From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 07 Feb 2014 02:51:30 +0000
Subject: Re: [patch 2/2] staging: r8188eu: overflow in rtw_p2p_get_go_device_address()
Message-Id: <52F44A32.7040102@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140203223835.GB28874@elgon.mountain>
In-Reply-To: <20140203223835.GB28874@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 02/03/2014 04:38 PM, Dan Carpenter wrote:
> The go_devadd_str[] array is two characters too small to hold the
> address so we corrupt memory.
>
> I've changed the user space API slightly and I don't have a way to test
> if this breaks anything.  In the original code we truncated away the
> last digit of the address and the NUL terminator so it was already a bit
> broken.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nothing seems to be broken.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

>
> diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> index dec992569476..4ad80ae1067f 100644
> --- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> @@ -3164,9 +3164,7 @@ static int rtw_p2p_get_go_device_address(struct net_device *dev,
>   	u8 *p2pie;
>   	uint p2pielen = 0, attr_contentlen = 0;
>   	u8 attr_content[100] = {0x00};
> -
> -	u8 go_devadd_str[17 + 10] = {0x00};
> -	/*  +10 is for the str "go_devadd =", we have to clear it at wrqu->data.pointer */
> +	u8 go_devadd_str[17 + 12] = {};
>
>   	/*	Commented by Albert 20121209 */
>   	/*	The input data is the GO's interface address which the application wants to know its device address. */
> @@ -3223,12 +3221,12 @@ static int rtw_p2p_get_go_device_address(struct net_device *dev,
>   	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
>
>   	if (!blnMatch)
> -		sprintf(go_devadd_str, "\n\ndev_add = NULL");
> +		snprintf(go_devadd_str, sizeof(go_devadd_str), "\n\ndev_add = NULL");
>   	else
> -		sprintf(go_devadd_str, "\n\ndev_add =%.2X:%.2X:%.2X:%.2X:%.2X:%.2X",
> +		snprintf(go_devadd_str, sizeof(go_devadd_str), "\n\ndev_add =%.2X:%.2X:%.2X:%.2X:%.2X:%.2X",
>   			attr_content[0], attr_content[1], attr_content[2], attr_content[3], attr_content[4], attr_content[5]);
>
> -	if (copy_to_user(wrqu->data.pointer, go_devadd_str, 10 + 17))
> +	if (copy_to_user(wrqu->data.pointer, go_devadd_str, sizeof(go_devadd_str)))
>   		return -EFAULT;
>   	return ret;
>   }
>

