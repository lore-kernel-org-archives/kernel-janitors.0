From: Hank Janssen <hjanssen@microsoft.com>
Date: Thu, 30 Jul 2009 18:37:16 +0000
Subject: RE: [PATCH] Staging: hv: Replace typedef SG_BUFFER_LIST by struct
Message-Id: <8AFC7968D54FB448A30D8F38F259C56209A94E87@TK5EX14MBXC114.redmond.corp.microsoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907301737.23849.npalix@diku.dk>
 <20090730155844.GB20557@suse.de>
 <Pine.LNX.4.64.0907302020250.13698@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907302020250.13698@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>, Greg KH <gregkh@suse.de>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



Nicolas,

I was getting into the RingBuffer as well. Do you want to combine efforts?

Thanks,

Hank.


On Thu, 30 Jul 2009, Greg KH wrote:

> On Thu, Jul 30, 2009 at 05:37:23PM +0200, Nicolas Palix wrote:
>>
>> typedef SG_BUFFER_LIST is removed and its uses are replaced by the use of
>> struct scatterlist.
>
> Sweet!  thanks for doing this, very nice job, I'll go queue it up.

I tried to change the RingBuffer too but I did not know
which API I should use.
The ring buffer in kernel/trace seems fine but it has some
dedicated features.

Any hint?
Of which infrastructure are you thinking in your previous mail?


