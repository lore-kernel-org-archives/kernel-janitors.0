From: walter harms <wharms@bfs.de>
Date: Wed, 27 Feb 2013 21:42:23 +0000
Subject: Re: [patch 1/2] wlan-ng: clean up prism2sta_inf_chinforesults()
Message-Id: <512E7DBF.2070703@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130227051206.GA22703@longonot.mountain>
In-Reply-To: <20130227051206.GA22703@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.02.2013 06:12, schrieb Dan Carpenter:
> This function is ugly because it hits against the 80 character
> limit.  This patch does several things to clean it up.
> 
> 1) Introduces "result" instead of inf->info.chinforesult.result[n].
> 2) Reverses the ".scanchannels & (1 << i)" so everthing can be
>    pulled in one indent level.
> 3) Use "chan" instead of "channel".
> 4) Tweaks the line breaks to the call to pr_debug().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
> index 8d2277b..dc221f2 100644
> --- a/drivers/staging/wlan-ng/prism2sta.c
> +++ b/drivers/staging/wlan-ng/prism2sta.c
> @@ -1160,30 +1160,30 @@ static void prism2sta_inf_chinforesults(wlandevice_t *wlandev,
>  	    le16_to_cpu(inf->info.chinforesult.scanchannels);
>  
>  	for (i = 0, n = 0; i < HFA384x_CHINFORESULT_MAX; i++) {


would you mind to move the n=0 out of the for ? it has nothing (directly) todo with
the loop. i found it confusing.

> -		if (hw->channel_info.results.scanchannels & (1 << i)) {
> -			int channel > -			    le16_to_cpu(inf->info.chinforesult.result[n].chid) -
> -			    1;
> -			hfa384x_ChInfoResultSub_t *chinforesult > -			    &hw->channel_info.results.result[channel];
> -			chinforesult->chid = channel;
> -			chinforesult->anl > -			    le16_to_cpu(inf->info.chinforesult.result[n].anl);
> -			chinforesult->pnl > -			    le16_to_cpu(inf->info.chinforesult.result[n].pnl);
> -			chinforesult->active > -			    le16_to_cpu(inf->info.chinforesult.result[n].
> -					active);
> -	pr_debug
> -		("chinfo: channel %d, %s level (avg/peak)=%d/%d dB, pcf %d\n",
> -			     channel + 1,
> -			     chinforesult->
> -			     active & HFA384x_CHINFORESULT_BSSACTIVE ? "signal"
> -			     : "noise", chinforesult->anl, chinforesult->pnl,
> -			     chinforesult->
> -			     active & HFA384x_CHINFORESULT_PCFACTIVE ? 1 : 0);
> -			n++;
> -		}
> +		hfa384x_ChInfoResultSub_t *result;
> +		hfa384x_ChInfoResultSub_t *chinforesult;
> +		int chan;
> +
> +		if (!(hw->channel_info.results.scanchannels & (1 << i)))
> +			continue;
> +
> +		result = &inf->info.chinforesult.result[n];
> +		chan = le16_to_cpu(result->chid) - 1;
> +
> +		chinforesult = &hw->channel_info.results.result[chan];
> +		chinforesult->chid = chan;
> +		chinforesult->anl = le16_to_cpu(result->anl);
> +		chinforesult->pnl = le16_to_cpu(result->pnl);
> +		chinforesult->active = le16_to_cpu(result->active);
> +
> +		pr_debug("chinfo: channel %d, %s level (avg/peak)=%d/%d dB, pcf %d\n",
> +			 chan + 1,
> +			 (chinforesult->active & HFA384x_CHINFORESULT_BSSACTIVE)
> +				? "signal" : "noise",
> +			 chinforesult->anl, chinforesult->pnl,
> +			 (chinforesult->active & HFA384x_CHINFORESULT_PCFACTIVE)
> +				? 1 : 0);
> +		n++;
>  	}
>  	atomic_set(&hw->channel_info.done, 2);

This is much better readable !

but i am missing the point why where are two counters.
i is simple. it is used to check the bitfield hw->channel_info.results.scanchannels
n is increased only the when a bit is set. So it would be more easy to simply
count the bits and run the loop about that number.
But i can also imagine that the bitfield act as "enable" and the author actualy
should read &inf->info.chinforesult.result[i];

perhaps i am missing the point, could someone tell me were i am wrong ?

re,
 wh

>  
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
