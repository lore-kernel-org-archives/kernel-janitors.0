From: maowenan <maowenan@huawei.com>
Date: Mon, 18 Mar 2019 13:57:14 +0000
Subject: Re: [PATCH net] staging: rtl8188eu: use is_zero_ether_addr() instead of memcmp()
Message-Id: <eac0fbf3-c52c-fd76-06cf-5bd27f94b39f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190309032600.98732-1-maowenan@huawei.com>
 <20190317112647.GG4614@kroah.com>
In-Reply-To: <20190317112647.GG4614@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com, jananis37@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, davem@davemloft.net



On 2019/3/17 19:26, Greg KH wrote:
> On Sat, Mar 09, 2019 at 11:26:00AM +0800, Mao Wenan wrote:
>> Using is_zero_ether_addr() instead of directly use
>> memcmp() to determine if the ethernet address is all
>> zeros.
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
>> index 714f7a70ed64..beae367df93b 100644
>> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
>> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
>> @@ -180,9 +180,8 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>>  {
>>  	struct list_head *phead, *plist;
>>  	struct wlan_network *pnetwork = NULL;
>> -	u8 zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
>>  
>> -	if (!memcmp(zero_addr, addr, ETH_ALEN)) {
>> +	if (is_zero_ether_addr(addr)) {
> 
> As Joe said, you have to prove that this is properly aligned before you
> can call this function.  Please do so.

The previous function to call rtw_find_network(), has been aligned for parameter 'addr',
because it has been defined an arry[6];
such as unsigned char MacAddress[ETH_ALEN] in struct wlan_bssid_ex;
 179 struct wlan_bssid_ex {
 180         u32  Length;
 181         unsigned char MacAddress[ETH_ALEN];
 182         u8  Reserved[2];/* 0]: IS beacon frame */
 183         struct ndis_802_11_ssid  ssid;
 184         u32  Privacy;
 185         NDIS_802_11_RSSI  Rssi;/* in dBM,raw data ,get from PHY) */
 186         enum  NDIS_802_11_NETWORK_TYPE  NetworkTypeInUse;
 187         struct ndis_802_11_config  Configuration;
 188         enum ndis_802_11_network_infra  InfrastructureMode;
 189         unsigned char SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 190         struct wlan_phy_info    PhyInfo;
 191         u32  ie_length;
 192         u8  ies[MAX_IE_SZ];     /* timestamp, beacon interval, and
 193                                  * capability information)
 194                                  */
 195 } __packed;

rtw_survey_event_callback->rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->MacAddress);
struct wlan_bssid_ex *pnetwork;

> 
> thanks,
> 
> greg k-h
> 
> .
> 
