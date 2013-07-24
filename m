From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Wed, 24 Jul 2013 16:19:38 +0000
Subject: Re: [PATCH 1/9] Staging:wlan-ng:cfg80211.c,p80211conv.h,p80211metastruct.h,p80211netdev.h: Fixed cod
Message-Id: <51EFFBCA.4070601@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374673972-10041-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1374673972-10041-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 24 July 2013 09:31 PM, Dan Carpenter wrote:
> On Wed, Jul 24, 2013 at 08:55:34PM +0530, Kumar Gaurav wrote:
>> Thanks for your valuable suggestions.
>> Sorry to ask stupid questions but still i do have before i can
>> correct fix for above. Please spare me and answer them
>>
>>      1.    Is it correct to change variable names for long variables
>> in code without notifying the author of the code?
> Sending to kernel-janitors is just practice.  Next time send it to
> the people from ./scripts/get_maintainer.pl (You need git for this
> to work correctly really).
>
> But I help maintain staging/ so I know what patches are likely to be
> applied there.
>
>>      2.    How would i align long statement in multiple lines so that
>> they remain readable (this i'll google now, but still adding)
> -		bss = cfg80211_inform_bss(wiphy,
> -                       ieee80211_get_channel(wiphy, ieee80211_dsss_chan_to_freq(msg2.dschannel.data)),
> +		freq = ieee80211_dsss_chan_to_freq(msg2.dschannel.data);
> +		chan = ieee80211_get_channel(wiphy, freq);
> +		bss = cfg80211_inform_bss(wiphy, chan, ...
>
> etc.
>
> regards,
> dan carpenter
>
Got it.. Thanks a lot. And yeah cloning completed so i can get 
maintainers as well.

This time i randomly checked this driver to fix and to work on. can you 
tell me that for beginners which area will be well?

     Like working on
     1. filesystem codes
     2. Drivers (if yes then should i be specific or should work on all 
of them)
     etc


Regards,
Kumar Gaurav
