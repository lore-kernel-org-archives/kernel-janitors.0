From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 29 May 2018 09:23:40 +0000
Subject: Re: [PATCH] mac80211_hwsim: add error check to call to rhashtable_init
Message-Id: <c42f3558-a126-5b68-8203-b937998ec8db@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180529091412.8530-1-colin.king@canonical.com>
 <1527585428.6955.7.camel@sipsolutions.net>
In-Reply-To: <1527585428.6955.7.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 29/05/18 10:17, Johannes Berg wrote:
> On Tue, 2018-05-29 at 10:14 +0100, Colin King wrote:
>>
>> @@ -3573,7 +3573,9 @@ static int __init init_mac80211_hwsim(void)
>>  	hwsim_wq = alloc_workqueue("hwsim_wq", 0, 0);
>>  	if (!hwsim_wq)
>>  		return -ENOMEM;
>> -	rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
>> +	err = rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
>> +	if (err)
>> +		return err;
> 
> That's missing a workqueue free, but I can fix that while applying if
> you prefer.

Please do. Thanks
> 
> johannes
> 

