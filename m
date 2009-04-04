From: Martin Olsson <mnemo@minimum.se>
Date: Sat, 04 Apr 2009 12:21:51 +0000
Subject: Re: [PATCH 2/2] Fix paramater/parameter typo in dmesg and source
Message-Id: <49D750DF.5050405@minimum.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49D73B52.5050508@minimum.se>
In-Reply-To: <49D73B52.5050508@minimum.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> drivers/net/wireless/rndis_wlan.c:	devdbg(dev, "setting rndis config paramater failed, %d.", ret);
> 
> might be worth making another pass.  and while you're at it, you might
> grep for what i've noticed is a *very* common misspelling:
> "paramter".  i'm betting you'll find at least a few of those.


I've covered all instances found by grep already except one but that one
was inside a changelog and I didn't want to change that retrospectively.
I split them up into one patch for all source comment changes and another
patch for the debug print outs to dmesg etc.

The one you mention here is already covered by the debug print patch.

As you suspected, paramter is even more common in the kernel dev vocabulary :)
I might do the some more patches later if the first ones are well received / pushed.



		Martin
