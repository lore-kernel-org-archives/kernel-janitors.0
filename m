From: walter harms <wharms@bfs.de>
Date: Thu, 17 Jan 2013 19:03:15 +0000
Subject: Re: [patch] b43: N-PHY: fix gain in b43_nphy_get_gain_ctl_workaround_ent()
Message-Id: <50F84AF3.5070901@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130113200309.GB5907@elgon.mountain> <20130114200417.GC12018@tuxdriver.com>
In-Reply-To: <20130114200417.GC12018@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Stefano Brivio <stefano.brivio@polimi.it>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, kernel-janitors@vger.kernel.org



Am 14.01.2013 21:04, schrieb John W. Linville:
> On Sun, Jan 13, 2013 at 11:03:09PM +0300, Dan Carpenter wrote:
>> There were no break statements in this switch statement so everything
>> used the default settings.

great :)

>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> Static checker stuff.  Untested.
>>
>> diff --git a/drivers/net/wireless/b43/tables_nphy.c b/drivers/net/wireless/b43/tables_nphy.c
>> index 97d4e27..6a1c838 100644
>> --- a/drivers/net/wireless/b43/tables_nphy.c
>> +++ b/drivers/net/wireless/b43/tables_nphy.c
>> @@ -3259,20 +3259,28 @@ struct nphy_gain_ctl_workaround_entry *b43_nphy_get_gain_ctl_workaround_ent(
>>  		switch (tr_iso) {
>>  		case 0:
>>  			e->cliplo_gain = 0x0062;
>> +			break;
>>  		case 1:
>>  			e->cliplo_gain = 0x0064;
>> +			break;
>>  		case 2:
>>  			e->cliplo_gain = 0x006a;
>> +			break;
>>  		case 3:
>>  			e->cliplo_gain = 0x106a;
>> +			break;
>>  		case 4:
>>  			e->cliplo_gain = 0x106c;
>> +			break;
>>  		case 5:
>>  			e->cliplo_gain = 0x1074;
>> +			break;
>>  		case 6:
>>  			e->cliplo_gain = 0x107c;
>> +			break;
>>  		case 7:
>>  			e->cliplo_gain = 0x207c;
>> +			break;
>>  		default:
>>  			e->cliplo_gain = 0x106a;
>>  		}
> 
> Wow...nice find!
> 
> This seems like it could be significant.  Any comments from the
> b43 folks?  Should this go to 3.8?
> 

perhaps an array would be more simple here ?


if (tr_iso > 7 )
 e->cliplo_gain = 0x106a;
{
 int data[]={0x0062,0x0064,0x006a,0x106a,0x106c,0x1074,0x107c,0x207c};
  e->cliplo_gain = data[tr_iso];

}
