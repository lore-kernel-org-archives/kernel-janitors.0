From: Dan Carpenter <error27@gmail.com>
Date: Mon, 12 Jul 2010 16:19:16 +0000
Subject: Re: [PATCH] Staging: line6: fix leaks in line6_probe()
Message-Id: <20100712161916.GB5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278946051-30118-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278946051-30118-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Frederik Deweerdt <frederik.deweerdt@xprog.eu>, Tejun Heo <tj@kernel.org>, Stoyan Gaydarov <sgayda2@uiuc.edu>, =?iso-8859-1?Q?N=E9meth_M=E1rton?= <nm127@freemail.hu>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, Jul 12, 2010 at 06:47:30PM +0400, Kulikov Vasiliy wrote:
> -	if (ret < 0) {
> -		line6_destruct(interface);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto err_put;

This should be:
		goto err_destruct;

regards,
dan carpenter

>  
>  	dev_info(&interface->dev, "Line6 %s now attached\n",
>  		 line6->properties->name);
>  	line6_devices[devnum] = line6;
>  	line6_list_devices();
> +	return 0;
> +
> +err_destruct:
> +	line6_destruct(interface);
> +err_put:
> +	usb_put_intf(interface);
> +	usb_put_dev(usbdev);
>  	return ret;
>  }
>  

