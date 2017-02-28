From: Bart Van Assche <Bart.VanAssche@sandisk.com>
Date: Tue, 28 Feb 2017 22:45:48 +0000
Subject: Re: [patch] net/mlx4: && vs & typo
Message-Id: <1D08B61A9CF0974AA09887BE32D889DA0C193A@ULS-OP-MBXIP03.sdcorp.global.sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228120215.GA27947@mwanda>
 <1488296129.3056.1.camel@sandisk.com> <1488320630.25838.39.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "eugenia-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org" <eugenia-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, "dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org" <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 02/28/2017 02:23 PM, Joe Perches wrote:
> On Tue, 2017-02-28 at 15:35 +0000, Bart Van Assche wrote:
>> On Tue, 2017-02-28 at 15:02 +0300, Dan Carpenter wrote:
>>> Bitwise & was obviously intended here.
> []
>>> diff --git a/include/linux/mlx4/driver.h b/include/linux/mlx4/driver.h
> []
>>> @@ -109,7 +109,7 @@ static inline void 	(u8 *addr, u64 mac)
>>>  	int i;
>>>  
>>>  	for (i = ETH_ALEN; i > 0; i--) {
>>> -		addr[i - 1] = mac && 0xFF;
>>> +		addr[i - 1] = mac & 0xFF;
>>>  		mac >>= 8;
>>>  	}
>>>  }
>>
>> Is this the only place where such a loop occurs?
> 
> Seems to be.
> 
>> Should a put_unaligned_be48()
>> function be introduced?
> 
> Why?  This is used exactly once.

Really? Here is an example of another open-coded version of
put_unaligned_be48() from arch/mips/cavium-octeon/octeon-platform.c:

	new_mac[0] = (mac >> 40) & 0xff;
	new_mac[1] = (mac >> 32) & 0xff;
	new_mac[2] = (mac >> 24) & 0xff;
	new_mac[3] = (mac >> 16) & 0xff;
	new_mac[4] = (mac >> 8) & 0xff;
	new_mac[5] = mac & 0xff;

Bart.
