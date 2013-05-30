From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 30 May 2013 05:11:24 +0000
Subject: Re: [Patch] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <alpine.DEB.2.02.1305300709280.2010@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6D6F6.1050204@gmail.com>
In-Reply-To: <51A6D6F6.1050204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
> --- a/drivers/staging/winbond/wb35reg.c	2013-05-28 00:52:26.000000000 +0530
> +++ b/drivers/staging/winbond/wb35reg.c	2013-05-28 02:11:35.000000000 +0530
> @@ -64,12 +64,11 @@ unsigned char Wb35Reg_BurstWrite(struct
>  
>  		return true;
>  	} else {
> -		if (urb)
> -			usb_free_urb(urb);
> +		usb_free_urb(urb);

I took a look at this case.  Wouldn't it be nicer to check for failures 
one by one, as done almost everywhere else in the kernel?  Then you would 
know what had been successfully allocated and what has to be freed.

julia



>  		kfree(reg_queue);
>  		return false;
>  	}
> -   return false;
> +	return false;
>  }
>  
>  void Wb35Reg_Update(struct hw_data *pHwData,  u16 RegisterNo,  u32 RegisterValue)
> @@ -206,8 +205,7 @@ unsigned char Wb35Reg_Write(struct hw_da
>  
>  		return true;
>  	} else {
> -		if (urb)
> -			usb_free_urb(urb);
> +		usb_free_urb(urb);
>  		kfree(reg_queue);
>  		return false;
>  	}
> @@ -270,8 +268,7 @@ unsigned char Wb35Reg_WriteWithCallbackV
>  		Wb35Reg_EP0VM_start(pHwData);
>  		return true;
>  	} else {
> -		if (urb)
> -			usb_free_urb(urb);
> +		usb_free_urb(urb);
>  		kfree(reg_queue);
>  		return false;
>  	}
> @@ -374,8 +371,7 @@ unsigned char Wb35Reg_Read(struct hw_dat
>  
>  		return true;
>  	} else {
> -		if (urb)
> -			usb_free_urb(urb);
> +		usb_free_urb(urb);
>  		kfree(reg_queue);
>  		return false;
>  	}
> diff -uprN a/drivers/staging/winbond/wb35rx.c b/drivers/staging/winbond/wb35rx.c
> --- a/drivers/staging/winbond/wb35rx.c	2013-05-28 00:52:40.000000000 +0530
> +++ b/drivers/staging/winbond/wb35rx.c	2013-05-28 02:25:16.000000000 +0530
> @@ -343,8 +343,7 @@ void Wb35Rx_destroy(struct hw_data *pHwD
>  	} while (pWb35Rx->EP3vm_state != VM_STOP);
>  	msleep(10); /* Delay for waiting function exit */
>  
> -	if (pWb35Rx->RxUrb)
> -		usb_free_urb(pWb35Rx->RxUrb);
> +	usb_free_urb(pWb35Rx->RxUrb);
>  	pr_debug("Wb35Rx_destroy OK\n");
>  }
>  
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
