From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Jan 2020 11:57:11 +0000
Subject: Re: [PATCH][next] ath11k: avoid null pointer dereference when pointer band is null
Message-Id: <17571eee-9d72-98cb-00f5-d714a28b853b@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d5d54e035e4d69ad4ffb4a835a495a@huawei.com>
 <64797126-0c77-4c2c-ad2b-29d7af452c13@wanadoo.fr>
In-Reply-To: <64797126-0c77-4c2c-ad2b-29d7af452c13@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: David Miller <davem@davemloft.net>, linux-wireless@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Le 11/01/2020 à 10:50, linmiaohe a écrit :
> Colin Ian King<colin.king@canonical.com>  wrote：
>> From: Colin Ian King<colin.king@canonical.com>
>>
>> In the unlikely event that cap->supported_bands has neither WMI_HOST_WLAN_2G_CAP set or WMI_HOST_WLAN_5G_CAP set then pointer band is null and a null dereference occurs when assigning
>> band->n_iftype_data.  Move the assignment to the if blocks to
>> avoid this.  Cleans up static analysis warnings.
>>
>> Addresses-Coverity: ("Explicit null dereference")
>> Fixes: 9f056ed8ee01 ("ath11k: add HE support")
>> Signed-off-by: Colin Ian King<colin.king@canonical.com>
>> ---
>> drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
> It looks fine for me. Thanks.
> Reviewed-by: Miaohe Lin<linmiaohe@huawei.com>
(sorry for incomplete mail and mailing list addresses, my newsreader ate 
them, and I cannot get the list from get_maintainer.pl because my 
(outdated) tree does not have ath11k/...
I've only including the ones in memory of my mail writer.

Please forward if needed)


Hi

Shouldn't there be a

|

- band->n_iftype_data  =  count; at the end of the patch if the assignment is *moved*? Without it, 
'band' (as well as 'count') could be un-initialized, and lead to memory 
corruption. Just my 2c. CJ |
