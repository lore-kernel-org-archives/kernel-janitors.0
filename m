From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 09:54:51 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <22739fd9-1538-9abf-bfbe-5467196b4acf@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
 <20180705095207.3dldyjgqivp5drhc@mwanda>
In-Reply-To: <20180705095207.3dldyjgqivp5drhc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/07/18 10:52, Dan Carpenter wrote:
> On Thu, Jul 05, 2018 at 10:37:32AM +0100, Colin King wrote:
>> diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
>> index 88c12474a0c3..2d6b62c6d9ab 100644
>> --- a/drivers/net/ethernet/sun/niu.c
>> +++ b/drivers/net/ethernet/sun/niu.c
>> @@ -1225,17 +1225,13 @@ static int link_status_1g_rgmii(struct niu *np, int *link_up_p)
>>  
>>  	bmsr = err;
>>  	if (bmsr & BMSR_LSTATUS) {
>> -		u16 adv, lpa;
>> -
>>  		err = mii_read(np, np->phy_addr, MII_ADVERTISE);
>>  		if (err < 0)
>>  			goto out;
>> -		adv = err;
>>  
>>  		err = mii_read(np, np->phy_addr, MII_LPA);
>>  		if (err < 0)
>>  			goto out;
>> -		lpa = err;
> 
> I'm fairly sure we could get rid of the mii_read() calls as well.

I'm always concerned that removing the reads of H/W registers can affect
the behavior, so I left those in.

Colin

> 
> regards,
> dan carpenter
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

