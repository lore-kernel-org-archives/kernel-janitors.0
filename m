From: maowenan <maowenan@huawei.com>
Date: Tue, 12 Mar 2019 06:58:36 +0000
Subject: Re: [PATCH net] staging: rtl8188eu: use is_zero_ether_addr() instead of memcmp()
Message-Id: <22e39cdc-6c66-f08a-f2b3-e2637e0b810b@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190309032600.98732-1-maowenan@huawei.com>
 <951c83d2-fa0d-11ed-96a9-cee620c9c096@huawei.com>
 <e192c19b35ba5a07ed6bea571546800cc3235282.camel@perches.com>
In-Reply-To: <e192c19b35ba5a07ed6bea571546800cc3235282.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, straube.linux@gmail.com, jananis37@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, davem@davemloft.net



On 2019/3/12 14:35, Joe Perches wrote:
> On Tue, 2019-03-12 at 14:29 +0800, maowenan wrote:
>> ping...
>>
>> On 2019/3/9 11:26, Mao Wenan wrote:
>>> Using is_zero_ether_addr() instead of directly use
>>> memcmp() to determine if the ethernet address is all
>>> zeros.
> []
>>> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> []
>>> @@ -180,9 +180,8 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>>>  {
>>>  	struct list_head *phead, *plist;
>>>  	struct wlan_network *pnetwork = NULL;
>>> -	u8 zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
>>>  
>>> -	if (!memcmp(zero_addr, addr, ETH_ALEN)) {
>>> +	if (is_zero_ether_addr(addr)) {
> 
> How did you verify that addr is __aligned(2)?

/**
 * is_zero_ether_addr - Determine if give Ethernet address is all zeros.
 * @addr: Pointer to a six-byte array containing the Ethernet address
 *
 * Return true if the address is all zeroes.
 */
I think they are completely equivalent functions, no need to check addr is __aligned(2),
because addr may be defined as unsigned char MacAddress[ETH_ALEN]; the length is 6.
> 
> 
> 
> .
> 
