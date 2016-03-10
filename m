From: Chris Boot <bootc@bootc.net>
Date: Thu, 10 Mar 2016 20:56:05 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR
Message-Id: <56E1DF65.3060209@bootc.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302100912.GD5533@mwanda>
 <1457163214.19657.288.camel@haakon3.risingtidesystems.com>
 <2A1ED37C-C556-4B3D-A59B-3369E5DFB4D5@bootc.net>
 <1457170394.19657.291.camel@haakon3.risingtidesystems.com>
In-Reply-To: <1457170394.19657.291.camel@haakon3.risingtidesystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/03/16 09:33, Nicholas A. Bellinger wrote:
> On Sat, 2016-03-05 at 08:45 +0000, Chris Boot wrote:
>> Are these in linux-next or another branch somewhere I can easily clone
>> them from?
> 
> The patch series is in target-pending/for-next.

Hi Nic,

I've just managed to resurrect a test rig for this (the hardware I had
for it has stopped being usable, yay!), and my initial testing shows the
updated code panics on the first submitted IO.

I'll go and debug it now and see what I can get from it, but I thought
I'd let you know ASAP.

Cheers,
Chris

-- 
Chris Boot
bootc@bootc.net
