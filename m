From: Scott Wood <scottwood@freescale.com>
Date: Mon, 12 May 2008 17:22:44 +0000
Subject: Re: [PATCH 4/6] drivers/net/fs_enet: remove null pointer dereference
Message-Id: <48287CE4.9050304@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121537590.3694@ask.diku.dk>
	<20080512165142.GC22190@electric-eye.fr.zoreil.com>
In-Reply-To: <20080512165142.GC22190@electric-eye.fr.zoreil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, vbordug@ru.mvista.com, jgarzik@pobox.com

Francois Romieu wrote:
> Julia Lawall <julia@diku.dk> :
> [...]
>> diff -u -p a/drivers/net/fs_enet/fs_enet-main.c b/drivers/net/fs_enet/fs_enet-main.c
>> --- a/drivers/net/fs_enet/fs_enet-main.c	2008-04-27 11:41:11.000000000 +0200
>> +++ b/drivers/net/fs_enet/fs_enet-main.c	2008-05-12 09:41:52.000000000 +0200
>> @@ -1093,7 +1093,7 @@ err:
>>  		if (registered)
>>  			unregister_netdev(ndev);
>>  
>> -		if (fep != NULL) {
>> +		if (fep && fep->ops) {
>>  			(*fep->ops->free_bd)(ndev);
>>  			(*fep->ops->cleanup_data)(ndev);
>>  		}
> 
> Extra cookies for the nice soul who:
> - removes the 'if (registered)' test (it can not happen)
> - uses different error lablels and unrolls the error path. I can not claim
>   that the current error path is wrong but it would not hurt if it was more
>   trivially balanced.
> 

Please note that this code is going away very soon, when arch/ppc dies.

-Scott
