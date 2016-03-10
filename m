From: Chris Boot <bootc@bootc.net>
Date: Thu, 10 Mar 2016 21:52:41 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR
Message-Id: <56E1ECA9.3000302@bootc.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302100912.GD5533@mwanda>
 <1457163214.19657.288.camel@haakon3.risingtidesystems.com>
 <2A1ED37C-C556-4B3D-A59B-3369E5DFB4D5@bootc.net>
 <1457170394.19657.291.camel@haakon3.risingtidesystems.com>
 <56E1DF65.3060209@bootc.net>
In-Reply-To: <56E1DF65.3060209@bootc.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/03/16 20:56, Chris Boot wrote:
> On 05/03/16 09:33, Nicholas A. Bellinger wrote:
>> On Sat, 2016-03-05 at 08:45 +0000, Chris Boot wrote:
>>> Are these in linux-next or another branch somewhere I can easily clone
>>> them from?
>>
>> The patch series is in target-pending/for-next.
> 
> Hi Nic,
> 
> I've just managed to resurrect a test rig for this (the hardware I had
> for it has stopped being usable, yay!), and my initial testing shows the
> updated code panics on the first submitted IO.

So this isn't the first IO, it's exactly the 2nd IO. I'm hitting
BUG_ON(se_cmd->se_tfo || se_cmd->se_sess) in target_submit_cmd_map_sgls().

I'm assuming the se_cmd is being reused due to percpu ida allocator, and
the code must be missing something to clean up the se_cmd sufficiently
once we're done with it.

At this point I'm out of my depth going through the target core, so I'd
appreciate some pointers to get any further!

Thanks,
Chris

-- 
Chris Boot
bootc@bootc.net
