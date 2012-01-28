From: walter harms <wharms@bfs.de>
Date: Sat, 28 Jan 2012 10:31:07 +0000
Subject: Re: boolean result from a test for a bit
Message-Id: <4F23CE6B.6070102@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
In-Reply-To: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.01.2012 21:29, schrieb Allan, Bruce W:
> For a simple boolean test of whether, for example, bit 5 is set in the variable 'flags', which of the following methods is preferred over the other?
> 
> bool result = (flags & (1 << 5)) ? true : false;
> 
> or
> 
> bool result = !!(flags & (1 << 5));
> 
> I've seen examples of both in the Linux kernel.
> 
> Thanks,
> Bruce.
> --

hi Bruce,
i think this is a matter of taste, but i would say
personaly i would go for option one since since !! can
easely be overlooked.

personaly i do not like bool.

re,
 wh
