From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 26 May 2011 12:03:35 +0000
Subject: Re: [patch 1/2] usbhid: use after free
Message-Id: <alpine.LNX.2.00.1105261347550.28291@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110526084916.GD14591@shale.localdomain>
In-Reply-To: <20110526084916.GD14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 26 May 2011, Dan Carpenter wrote:

> There are a couple use after free bugs here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  Please review carefully.
> 
> diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> index ff3c644..b2f9a3a 100644
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -248,12 +248,15 @@ static int hiddev_release(struct inode * inode, struct file * file)
>  			usbhid_close(list->hiddev->hid);
>  			usbhid_put_power(list->hiddev->hid);
>  		} else {
> +			mutex_unlock(&list->hiddev->existancelock);
>  			kfree(list->hiddev);
> +			kfree(list);
> +			return 0;
>  		}
>  	}
>  
> -	kfree(list);
>  	mutex_unlock(&list->hiddev->existancelock);
> +	kfree(list);

Good catch.

>  	return 0;
>  }
> @@ -926,7 +929,9 @@ void hiddev_disconnect(struct hid_device *hid)
>  		usbhid_close(hiddev->hid);
>  		wake_up_interruptible(&hiddev->wait);
>  	} else {
> +		mutex_unlock(&hiddev->existancelock);
>  		kfree(hiddev);
> +		return;
>  	}
>  	mutex_unlock(&hiddev->existancelock);

For this I already have a fix queued in my tree.

So I will be applying only the first hunk.

Thanks,

-- 
Jiri Kosina
SUSE Labs
