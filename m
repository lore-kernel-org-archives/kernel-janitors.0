From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 22 Apr 2012 19:28:03 +0000
Subject: Re: [PATCH] drivers/staging/rtl8192u/ieee80211/ieee80211_module.c: add missing free_netdev
Message-Id: <alpine.DEB.2.02.1204222127520.2065@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335096133-16951-1-git-send-email-Julia.Lawall@lip6.fr> <20120422152514.60e66f04@lappy.seanm.ca>
In-Reply-To: <20120422152514.60e66f04@lappy.seanm.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean MacLennan <seanm@seanm.ca>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sun, 22 Apr 2012, Sean MacLennan wrote:

> On Sun, 22 Apr 2012 14:02:13 +0200
> Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> Free dev on failure as done elsewhere in the function.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> ---
>>  drivers/staging/rtl8192u/ieee80211/ieee80211_module.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
>> b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c index
>> e3d47bc..82d4bf6 100644 ---
>> a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c +++
>> b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c @@ -161,7
>> +161,7 @@ struct net_device *alloc_ieee80211(int sizeof_priv) if
>> (ieee->pHTInfo = NULL) {
>>  		IEEE80211_DEBUG(IEEE80211_DL_ERR, "can't alloc
>> memory for HTInfo\n");
>> -		return NULL;
>> +		goto failed;
>>  	}
>>  	HTUpdateDefaultSetting(ieee);
>>  	HTInitializeHTInfo(ieee); //may move to other place.
>
> It looks like the rtl8192e/rtllib_module.c alloc_rtllib has the same
> error. They probably where based on the same function.

Thanks for the pointer.  I will take a look.

julia
