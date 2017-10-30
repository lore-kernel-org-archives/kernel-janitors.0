From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 13:44:31 +0000
Subject: Re: [PATCH 4/5] wlcore: Use common error handling code in wlcore_set_beacon_template()
Message-Id: <bc692c11-63f8-a914-8767-1fc4248faae8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc2b8a7c-b4a9-2f92-12b4-a1d0d6911d7c@users.sourceforge.net>
 <f50c8edf-834d-9003-5a3c-dc83ec4016ce@users.sourceforge.net>
 <CAGRGNgUEFpva3ct-idAzip97eVgoDDTeEArAPcjvf90VSORA2g@mail.gmail.com>
In-Reply-To: <CAGRGNgUEFpva3ct-idAzip97eVgoDDTeEArAPcjvf90VSORA2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Calaby <julian.calaby@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, Eyal Reizer <eyalr@ti.com>, Iain Hunter <drhunter95@gmail.com>, James Minor <james.minor@ni.com>, Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Maxim Altshul <maxim.altshul@ti.com>, Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

>> @@ -4081,9 +4078,8 @@ static int wlcore_set_beacon_template(struct wl1271 *wl,
>>                                               beacon->data,
>>                                               beacon->len, 0,
>>                                               min_rate);
>> -end_bcn:
>> +free_skb:
> 
> Why rename the label?

I find it clearer according to the Linux coding style.

Regards,
Markus
