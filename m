From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Wed, 24 Jul 2013 15:37:34 +0000
Subject: Re: [PATCH 1/9] Staging:wlan-ng:cfg80211.c,p80211conv.h,p80211metastruct.h,p80211netdev.h: Fixed cod
Message-Id: <51EFF1EE.7010607@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374673972-10041-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1374673972-10041-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 24 July 2013 08:34 PM, Dan Carpenter wrote:
> Everyone's first patch is rejected, and this is a newbie friendly
> list so don't worry that this patch is rejected.
>
> On Wed, Jul 24, 2013 at 07:22:52PM +0530, Kumar Gaurav wrote:
>> Fixed coding style issues
>> ---
> It doesn't apply.  Send it to yourself first and figure that bit
> out.  It has to apply with `cat email.txt | patch -p1` or better
> yet `cat email.txt | git am`.
>
> It needs a signed off line.
>
> This patch does too many things at once and needs to be split into
> multiple patches.  One patch to rename the defines, one to rework
> the includes,
>
>>   linux-3.11-rc2/drivers/staging/wlan-ng/cfg80211.c  |   99 +++++++++++++-------
>>   .../drivers/staging/wlan-ng/p80211conv.h           |    1 +
>>   .../drivers/staging/wlan-ng/p80211metastruct.h     |    2 +
>>   .../drivers/staging/wlan-ng/p80211netdev.h         |    9 +-
>>   4 files changed, 75 insertions(+), 36 deletions(-)
>>
>> diff --git a/linux-3.11-rc2/drivers/staging/wlan-ng/cfg80211.c b/linux-3.11-rc2/drivers/staging/wlan-ng/cfg80211.c
>> index f1bce18..a3f54f4 100644
>> --- a/linux-3.11-rc2/drivers/staging/wlan-ng/cfg80211.c
>> +++ b/linux-3.11-rc2/drivers/staging/wlan-ng/cfg80211.c
>> @@ -2,7 +2,20 @@
>>   
>>   
>>   /* Prism2 channel/frequency/bitrate declarations */
>> -static const struct ieee80211_channel prism2_channels[] = {
>> +/*define statement for making varnames more understandable and short*/
>> +#define WEPDEFKEY0 DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey0
>> +#define WEPDEFKEY1 DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey1
>> +#define WEPDEFKEY2 DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey2
>> +#define WEPDEFKEY3 DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey3
>> +#define RTSTHREASHOLD DIDmib_dot11mac_dot11OperationTable_dot11RTSThreshold
> Spelling mistake.  Should be THRESHOLD.
>
>> +#define FRMTHLD DIDmib_dot11mac_dot11OperationTable_dot11FragmentationThreshold
>> +#define CRRCHNL DIDmib_dot11phy_dot11PhyDSSSTable_dot11CurrentChannel
>> +#define DEFWEPKEYID DIDmib_dot11smt_dot11PrivacyTable_dot11WEPDefaultKeyID
>> +#define PRVCINVKD  DIDmib_dot11smt_dot11PrivacyTable_dot11PrivacyInvoked
>> +#define EXCLUNENC DIDmib_dot11smt_dot11PrivacyTable_dot11ExcludeUnencrypted
> Instead of having a reasonable name and a way too loooooonng,
> nonsense name, this should only have a reasonable name.  The long
> name should be deleted.
>
> These names are a bit too generic, they should have a prefix to
> show which driver they are associated with.  They are hard to read
> without underscores to separate the words.
>
> P80211DID_DEF_KEY0
> P80211DID_RTS_THRESHOLD
> P80211DID_FRM_THRESHOLD
> P80211DID_CUR_CHAN
> P80211DID_DEF_KEYID
> P80211DID_PRV_INVKD
> P80211DID_EXCL_UNENC
>
>> +
>> +
> Don't put two blank lines in a row.
>
>> +static const struct ieee80211_channel prism2_channels[14] = {
>>   	{ .center_freq = 2412 },
>>   	{ .center_freq = 2417 },
>>   	{ .center_freq = 2422 },
>> @@ -73,7 +86,8 @@ static int prism2_result2err(int prism2_result)
>>   static int prism2_domibset_uint32(wlandevice_t *wlandev, u32 did, u32 data)
>>   {
>>   	struct p80211msg_dot11req_mibset msg;
>> -	p80211item_uint32_t *mibitem = (p80211item_uint32_t *) &msg.mibattribute.data;
>> +	p80211item_uint32_t *mibitem
>> +		= (p80211item_uint32_t *) &msg.mibattribute.data;
>>   
> Just do these like this:
>
> 	p80211item_uint32_t *mibitem;
>
> 	mibitem = (p80211item_uint32_t *)&msg.mibattribute.data;
>
>>   	msg.msgcode = DIDmsg_dot11req_mibset;
>>   	mibitem->did = did;
>> @@ -86,7 +100,8 @@ static int prism2_domibset_pstr32(wlandevice_t *wlandev,
>>   				  u32 did, u8 len, u8 *data)
>>   {
>>   	struct p80211msg_dot11req_mibset msg;
>> -	p80211item_pstr32_t *mibitem = (p80211item_pstr32_t *) &msg.mibattribute.data;
>> +	p80211item_pstr32_t *mibitem
>> +		= (p80211item_pstr32_t *) &msg.mibattribute.data;
>>   
>>   	msg.msgcode = DIDmsg_dot11req_mibset;
>>   	mibitem->did = did;
>> @@ -122,7 +137,7 @@ int prism2_change_virtual_intf(struct wiphy *wiphy,
>>   		data = 1;
>>   		break;
>>   	default:
>> -		printk(KERN_WARNING "Operation mode: %d not support\n", type);
>> +		pr_warn(KERN_WARNING "Operation mode: %d not support\n", type);
>
> This isn't how this works.  I'm surprised this compiles actually.
> I can't test compiling this because it doesn't apply.
>
>>   		return -EOPNOTSUPP;
>>   	}
>>   
>> @@ -154,7 +169,7 @@ int prism2_add_key(struct wiphy *wiphy, struct net_device *dev,
>>   	case WLAN_CIPHER_SUITE_WEP40:
>>   	case WLAN_CIPHER_SUITE_WEP104:
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11smt_dot11PrivacyTable_dot11WEPDefaultKeyID,
>> +			DIDmib_dot11smt_dot11PrivacyTable_dot11WEPDefaultKeyID,
> The original is better even though it goes over the 80 character
> limit.
>
>>   						key_index);
>>   		if (result)
>>   			goto exit;
>> @@ -162,19 +177,19 @@ int prism2_add_key(struct wiphy *wiphy, struct net_device *dev,
>>   		/* send key to driver */
>>   		switch (key_index) {
>>   		case 0:
>> -			did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey0;
>> +			did = WEPDEFKEY0;
>>   			break;
>>   
>>   		case 1:
>> -			did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey1;
>> +			did = WEPDEFKEY1;
>>   			break;
>>   
>>   		case 2:
>> -			did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey2;
>> +			did = WEPDEFKEY2;
>>   			break;
>>   
>>   		case 3:
>> -			did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey3;
>> +			did = WEPDEFKEY3;
>>   			break;
>>   
>>   		default:
>> @@ -182,7 +197,8 @@ int prism2_add_key(struct wiphy *wiphy, struct net_device *dev,
>>   			goto exit;
>>   		}
>>   
>> -		result = prism2_domibset_pstr32(wlandev, did, params->key_len, params->key);
>> +		result = prism2_domibset_pstr32(wlandev, did, params->key_len,
>> +						params->key);
>>   		if (result)
>>   			goto exit;
>>   		break;
>> @@ -200,7 +216,8 @@ exit:
>>   }
>>   
>>   int prism2_get_key(struct wiphy *wiphy, struct net_device *dev,
>> -		   u8 key_index, bool pairwise, const u8 *mac_addr, void *cookie,
>> +		   u8 key_index, bool pairwise, const u8 *mac_addr,
>> +		   void *cookie,
>>   		   void (*callback)(void *cookie, struct key_params*))
>>   {
>>   	wlandevice_t *wlandev = dev->ml_priv;
>> @@ -242,22 +259,22 @@ int prism2_del_key(struct wiphy *wiphy, struct net_device *dev,
>>   	switch (key_index) {
>>   	case 0:
>>   		did >> -		    DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey0;
>> +		    WEPDEFKEY0;
>>   		break;
>>   
>>   	case 1:
>>   		did >> -		    DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey1;
>> +		    WEPDEFKEY1;
>>   		break;
>>   
>>   	case 2:
>>   		did >> -		    DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey2;
>> +		    WEPDEFKEY2;
>>   		break;
>>   
>>   	case 3:
>>   		did >> -		    DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey3;
>> +		    WEPDEFKEY3;
>>   		break;
>>   
>>   	default:
>> @@ -352,7 +369,7 @@ int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
>>   		return -EBUSY;
>>   
>>   	if (wlandev->macmode = WLAN_MACMODE_ESS_AP) {
>> -		printk(KERN_ERR "Can't scan in AP mode\n");
>> +		pr_err(KERN_ERR "Can't scan in AP mode\n");
>>   		return -EOPNOTSUPP;
>>   	}
>>   
>> @@ -379,7 +396,9 @@ int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
>>   		(i < request->n_channels) && i < ARRAY_SIZE(prism2_channels);
>>   		i++)
>>   		msg1.channellist.data.data[i] >> -			ieee80211_frequency_to_channel(request->channels[i]->center_freq);
>> +			ieee80211_frequency_to_channel(
>> +					request->channels[i]->center_freq
>> +						);
> The original was easier to read.
>
>
>>   	msg1.channellist.data.len = request->n_channels;
>>   
>>   	msg1.maxchanneltime.data = 250;
>> @@ -409,13 +428,17 @@ int prism2_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
>>   		ie_len = ie_buf[1] + 2;
>>   		memcpy(&ie_buf[2], &(msg2.ssid.data.data), msg2.ssid.data.len);
>>   		bss = cfg80211_inform_bss(wiphy,
>> -			ieee80211_get_channel(wiphy, ieee80211_dsss_chan_to_freq(msg2.dschannel.data)),
>> +			ieee80211_get_channel(wiphy,
>> +					      ieee80211_dsss_chan_to_freq(
>> +						      msg2.dschannel.data
>> +									)),
> The original was better.
>
>>   			(const u8 *) &(msg2.bssid.data.data),
>>   			msg2.timestamp.data, msg2.capinfo.data,
>>   			msg2.beaconperiod.data,
>>   			ie_buf,
>>   			ie_len,
>> -			(msg2.signal.data - 65536) * 100, /* Conversion to signed type */
>> +			/* Next line is for Conversion to signed type */
>> +			(msg2.signal.data - 65536) * 100,
>>   			GFP_KERNEL
>>   		);
>>   
>> @@ -451,7 +474,7 @@ int prism2_set_wiphy_params(struct wiphy *wiphy, u32 changed)
>>   			data = wiphy->rts_threshold;
>>   
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11mac_dot11OperationTable_dot11RTSThreshold,
>> +						RTSTHREASHOLD,
>>   						data);
>>   		if (result) {
>>   			err = -EFAULT;
>> @@ -466,7 +489,8 @@ int prism2_set_wiphy_params(struct wiphy *wiphy, u32 changed)
>>   			data = wiphy->frag_threshold;
>>   
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11mac_dot11OperationTable_dot11FragmentationThreshold,
>> +		/*FRMTHLD is macro*/
>> +						FRMTHLD,
> This is aligned wierdly.  This comment is not needed, actually.
>
>>   						data);
>>   		if (result) {
>>   			err = -EFAULT;
>> @@ -487,8 +511,9 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   	u32 did;
>>   	int length = sme->ssid_len;
>>   	int chan = -1;
>> -	int is_wep = (sme->crypto.cipher_group = WLAN_CIPHER_SUITE_WEP40) ||
>> -	    (sme->crypto.cipher_group = WLAN_CIPHER_SUITE_WEP104);
>> +	int is_wep = (sme->crypto.cipher_group = WLAN_CIPHER_SUITE_WEP40)
>> +			||
>> +		(sme->crypto.cipher_group = WLAN_CIPHER_SUITE_WEP104);
> The original was ugly as can be but still better.
>
>>   	int result;
>>   	int err = 0;
>>   
>> @@ -496,7 +521,8 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   	if (channel) {
>>   		chan = ieee80211_frequency_to_channel(channel->center_freq);
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11phy_dot11PhyDSSSTable_dot11CurrentChannel,
>> +		/*CRRCHNL is macro */
>> +						CRRCHNL,
>>   						chan);
>>   		if (result)
>>   			goto exit;
>> @@ -510,7 +536,7 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   		((sme->auth_type = NL80211_AUTHTYPE_AUTOMATIC) && is_wep))
>>   			msg_join.authtype.data = P80211ENUM_authalg_sharedkey;
>>   	else
>> -		printk(KERN_WARNING
>> +		pr_warn(KERN_WARNING
>>   			"Unhandled authorisation type for connect (%d)\n",
>>   			sme->auth_type);
>>   
>> @@ -518,7 +544,8 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   	if (is_wep) {
>>   		if (sme->key) {
>>   			result = prism2_domibset_uint32(wlandev,
>> -				DIDmib_dot11smt_dot11PrivacyTable_dot11WEPDefaultKeyID,
>> +			/*DEFWEPKEYID is macro*/
>> +				DEFWEPKEYID,
>>   				sme->key_idx);
>>   			if (result)
>>   				goto exit;
>> @@ -526,19 +553,19 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   			/* send key to driver */
>>   			switch (sme->key_idx) {
>>   			case 0:
>> -				did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey0;
>> +				did = WEPDEFKEY0;
>>   				break;
>>   
>>   			case 1:
>> -				did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey1;
>> +				did = WEPDEFKEY1;
>>   				break;
>>   
>>   			case 2:
>> -				did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey2;
>> +				did = WEPDEFKEY2;
>>   				break;
>>   
>>   			case 3:
>> -				did = DIDmib_dot11smt_dot11WEPDefaultKeysTable_dot11WEPDefaultKey3;
>> +				did = WEPDEFKEY3;
>>   				break;
>>   
>>   			default:
>> @@ -558,13 +585,15 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   		   We could possibly use sme->privacy here, but the assumption
>>   		   seems reasonable anyway */
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11smt_dot11PrivacyTable_dot11PrivacyInvoked,
>> +			/*PRVCINVKD is macro */
>> +						PRVCINVKD,
>>   						P80211ENUM_truth_true);
>>   		if (result)
>>   			goto exit;
>>   
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11smt_dot11PrivacyTable_dot11ExcludeUnencrypted,
>> +			/*EXCLUNENC is macro*/
> These sorts of obvious comments are not needed (it's just noise).
>
>> +						EXCLUNENC,
>>   						P80211ENUM_truth_true);
>>   		if (result)
>>   			goto exit;
>> @@ -573,13 +602,15 @@ int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>>   		/* Assume we should unset privacy invoked
>>   		   and exclude unencrypted */
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11smt_dot11PrivacyTable_dot11PrivacyInvoked,
>> +			/*PRVCINVKD is macro*/
>> +						PRVCINVKD,
>>   						P80211ENUM_truth_false);
>>   		if (result)
>>   			goto exit;
>>   
>>   		result = prism2_domibset_uint32(wlandev,
>> -						DIDmib_dot11smt_dot11PrivacyTable_dot11ExcludeUnencrypted,
>> +			/*EXCLUNENC is macro*/
>> +						EXCLUNENC,
>>   						P80211ENUM_truth_false);
>>   		if (result)
>>   			goto exit;
>> diff --git a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211conv.h b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211conv.h
>> index e031a74..a4f4add 100644
>> --- a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211conv.h
>> +++ b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211conv.h
>> @@ -53,6 +53,7 @@
>>   #ifndef _LINUX_P80211CONV_H
>>   #define _LINUX_P80211CONV_H
>>   
>> +#include "p80211hdr.h"
>>   #define WLAN_ETHADDR_LEN	6
>>   #define WLAN_IEEE_OUI_LEN	3
>>   
>> diff --git a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211metastruct.h b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211metastruct.h
>> index c501162..e49ab2c 100644
>> --- a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211metastruct.h
>> +++ b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211metastruct.h
>> @@ -46,6 +46,8 @@
>>   
>>   #ifndef _P80211MKMETASTRUCT_H
>>   #define _P80211MKMETASTRUCT_H
>> +#include "p80211msg.h"
>> +
>>   
>>   struct p80211msg_dot11req_mibget {
>>   	u32 msgcode;
>> diff --git a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211netdev.h b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211netdev.h
>> index 2fecca2..3b4a309 100644
>> --- a/linux-3.11-rc2/drivers/staging/wlan-ng/p80211netdev.h
>> +++ b/linux-3.11-rc2/drivers/staging/wlan-ng/p80211netdev.h
>> @@ -56,6 +56,10 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/wireless.h>
>>   #include <linux/netdevice.h>
>> +#include "p80211msg.h"
>> +#include "p80211conv.h"
>> +#include "p80211hdr.h"
>> +#include "p80211types.h"
>>   
> This stuff wasn't described in the changelog.
>
>>   #undef netdevice_t
>>   typedef struct net_device netdevice_t;
>> @@ -141,7 +145,7 @@ typedef struct p80211_frmrx_t {
>>   struct iw_statistics *p80211wext_get_wireless_stats(netdevice_t * dev);
>>   /* wireless extensions' ioctls */
>>   extern struct iw_handler_def p80211wext_handler_def;
>> -int p80211wext_event_associated(struct wlandevice *wlandev, int assoc);
>> +
>>   
>>   /* WEP stuff */
>>   #define NUM_WEPKEYS 4
>> @@ -226,7 +230,8 @@ typedef struct wlandevice {
>>   	char spy_address[IW_MAX_SPY][ETH_ALEN];
>>   	struct iw_quality spy_stat[IW_MAX_SPY];
>>   } wlandevice_t;
>> -
>> +//Reposition below definition to aviod warning
> This comment is not wanted.  The warning should be pasted in the
> changelog.
>
>
>> +int p80211wext_event_associated(struct wlandevice *wlandev, int assoc);
>>   /* WEP stuff */
>>   int wep_change_key(wlandevice_t *wlandev, int keynum, u8 *key, int keylen);
>>   int wep_decrypt(wlandevice_t *wlandev, u8 *buf, u32 len, int key_override,
> regards,
> dan carpenter
>
Thanks for your valuable suggestions.
Sorry to ask stupid questions but still i do have before i can correct 
fix for above. Please spare me and answer them

     1.    Is it correct to change variable names for long variables in 
code without notifying the author of the code?
     2.    How would i align long statement in multiple lines so that 
they remain readable (this i'll google now, but still adding)

Reagards,
Kumar Gaurav
