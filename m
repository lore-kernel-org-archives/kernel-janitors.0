From: Nicolas Kaiser <nikai@nikai.net>
Date: Sat, 11 Dec 2010 00:41:54 +0000
Subject: Re: [patch] isdn: return -EFAULT if copy_from_user() fails
Message-Id: <20101211014154.3157588b@absol.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101210124009.GC10623@bicker>
In-Reply-To: <20101210124009.GC10623@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Ahem, we're printing this return value:

* Dan Carpenter <error27@gmail.com>:
> -	if ((ret = copy_from_user(&size, p, sizeof(int)))) {
             ^^^
> +	if (copy_from_user(&size, p, sizeof(int))) {
>  		printk(KERN_ERR"isar_load_firmware copy_from_user ret %d\n", ret);
                                                                             ^^^
> -		return ret;
> +		return -EFAULT;

Cheers,
Nicolas Kaiser
