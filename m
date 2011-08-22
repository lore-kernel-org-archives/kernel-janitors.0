From: walter harms <wharms@bfs.de>
Date: Mon, 22 Aug 2011 19:09:26 +0000
Subject: Re: [PATCH 4/4] drivers/net/wireless/mwifiex/scan.c: test the just-initialized
Message-Id: <4E52A966.3090502@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314021636-11528-4-git-send-email-julia@diku.dk> <4E52638C.8080407@inria.fr> <Pine.LNX.4.64.1108221615450.10948@ask.diku.dk> <477F20668A386D41ADCC57781B1F70430802DD7B7E@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430802DD7B7E@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: Julia Lawall <julia@diku.dk>, Pierre Louis Aublin <pierre-louis.aublin@inria.fr>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



Am 22.08.2011 21:02, schrieb Bing Zhao:
> Hi Julia,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Julia Lawall [mailto:julia@diku.dk]
>> Sent: Monday, August 22, 2011 7:16 AM
>> To: Pierre Louis Aublin
>> Cc: Bing Zhao; kernel-janitors@vger.kernel.org; John W. Linville; linux-wireless@vger.kernel.org;
>> netdev@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: [PATCH 4/4] drivers/net/wireless/mwifiex/scan.c: test the just-initialized value
>>
>> From: Julia Lawall <julia@diku.dk>
>>
>> Test the just-initialized value rather than some other one.
>>
>> The semantic match that finds this problem is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @r@
>> identifier x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
>> statement S;
>> @@
>>
>> x = f(...);
>> (
>> if (\(x = NULL\|IS_ERR(x)\)) S
>> |
>> *if (\(y = NULL\|IS_ERR(y)\))
>>  { ... when != x
>>    return ...; }
>> )
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> Acked-by: Bing Zhao <bzhao@marvell.com>
> 
> 
> Thanks,
> Bing
> 
>>
>> ---
>>  drivers/net/wireless/mwifiex/scan.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mwifiex/scan.c b/drivers/net/wireless/mwifiex/scan.c
>> index b28241c..37ca2f9 100644
>> --- a/drivers/net/wireless/mwifiex/scan.c
>> +++ b/drivers/net/wireless/mwifiex/scan.c
>> @@ -1480,8 +1480,8 @@ mwifiex_update_curr_bss_params(struct mwifiex_private *priv,
>>  		return -ENOMEM;
>>  	}
>>  	beacon_ie = kzalloc(ie_len, GFP_KERNEL);
>> -	if (!bss_desc) {
>> -		dev_err(priv->adapter->dev, " failed to alloc bss_desc\n");
>> +	if (!beacon_ie) {
>> +		dev_err(priv->adapter->dev, " failed to alloc beacon_ie\n");
>>  		return -ENOMEM;
>>  	}
>>  	memcpy(beacon_ie, ie_buf, ie_len);
> --


this looks like a case for kmemdup()

just my 2 cents,

re,
 wh


