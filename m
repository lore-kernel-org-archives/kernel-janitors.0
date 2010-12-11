From: David Miller <davem@davemloft.net>
Date: Sat, 11 Dec 2010 00:47:21 +0000
Subject: Re: [patch] isdn: return -EFAULT if copy_from_user() fails
Message-Id: <20101210.164721.85429801.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101210124009.GC10623@bicker>
	<20101211014154.3157588b@absol.kitzblitz>
In-Reply-To: <20101211014154.3157588b@absol.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nikai@nikai.net
Cc: error27@gmail.com, isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Nicolas Kaiser <nikai@nikai.net>
Date: Sat, 11 Dec 2010 01:41:54 +0100

> Ahem, we're printing this return value:
> 
> * Dan Carpenter <error27@gmail.com>:
>> -	if ((ret = copy_from_user(&size, p, sizeof(int)))) {
>              ^^^
>> +	if (copy_from_user(&size, p, sizeof(int))) {
>>  		printk(KERN_ERR"isar_load_firmware copy_from_user ret %d\n", ret);
>                                                                              ^^^
>> -		return ret;
>> +		return -EFAULT;

I'll fix this, thanks.
