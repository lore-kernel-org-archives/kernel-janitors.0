From: walter harms <wharms@bfs.de>
Date: Wed, 22 Feb 2012 08:08:25 +0000
Subject: Re: [patch] Staging: wlan-ng: memsetting the wrong amount of data
Message-Id: <4F44A279.7010403@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120221141838.GA7998@elgon.mountain> <4F43C8CE.8060602@bfs.de> <20120222075438.GA3680@mwanda>
In-Reply-To: <20120222075438.GA3680@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jouni Malinen <jouni.malinen@atheros.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org



Am 22.02.2012 08:54, schrieb Dan Carpenter:
> On Tue, Feb 21, 2012 at 05:39:42PM +0100, walter harms wrote:
>>> -	memset(&(msg1.bssid.data), 0xFF, sizeof(p80211item_pstr6_t));
>>> +	memset(&msg1.bssid.data, 0xFF, sizeof(msg1.bssid.data));
>>>  	msg1.bssid.data.len = 6;
>>
>> maybe msg1.bssid.data.len is related to msg1.bssid.data ?
>> I guess sizeof(msg1.bssid.data)-1 (why -1).
>>
>> perhaps you can fix both ?
>>
> 
> It's an interesting point.  The problem is that I don't actually
> have this hardware.  On the patch which I sent, it was obvious what
> the intent.  My guess is that msg1.bssid.data[] should have 6
> elements instead of 7, but I don't feel confident enough to sign off
> on that.
> 
> Let's fix this bug which is obvious and let someone who knows how to
> fix that other question address it.
> 

Now it lokks better than before, lets wait what the maintainer can say about this.
otherwise what about a /* FIXME: */ ?

re,
 wh
