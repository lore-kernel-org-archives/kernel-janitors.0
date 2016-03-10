From: Chris Boot <bootc@bootc.net>
Date: Thu, 10 Mar 2016 22:58:53 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR
Message-Id: <56E1FC2D.8080902@bootc.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302100912.GD5533@mwanda>
 <1457163214.19657.288.camel@haakon3.risingtidesystems.com>
 <2A1ED37C-C556-4B3D-A59B-3369E5DFB4D5@bootc.net>
 <1457170394.19657.291.camel@haakon3.risingtidesystems.com>
 <56E1DF65.3060209@bootc.net> <56E1ECA9.3000302@bootc.net>
In-Reply-To: <56E1ECA9.3000302@bootc.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/03/16 21:52, Chris Boot wrote:
> On 10/03/16 20:56, Chris Boot wrote:
>> On 05/03/16 09:33, Nicholas A. Bellinger wrote:
>>> On Sat, 2016-03-05 at 08:45 +0000, Chris Boot wrote:
>>>> Are these in linux-next or another branch somewhere I can easily clone
>>>> them from?
>>>
>>> The patch series is in target-pending/for-next.
>>
>> Hi Nic,
>>
>> I've just managed to resurrect a test rig for this (the hardware I had
>> for it has stopped being usable, yay!), and my initial testing shows the
>> updated code panics on the first submitted IO.
> 
> So this isn't the first IO, it's exactly the 2nd IO. I'm hitting
> BUG_ON(se_cmd->se_tfo || se_cmd->se_sess) in target_submit_cmd_map_sgls().
> 
> I'm assuming the se_cmd is being reused due to percpu ida allocator, and
> the code must be missing something to clean up the se_cmd sufficiently
> once we're done with it.
> 
> At this point I'm out of my depth going through the target core, so I'd
> appreciate some pointers to get any further!

Replying to myself again... Worked it out after reading the thread about the usb gadget target. Here's the patch you want to squash into your existing series:

diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
index a04b0605f8d0..d021997cc837 100644
--- a/drivers/target/sbp/sbp_target.c
+++ b/drivers/target/sbp/sbp_target.c
@@ -933,6 +933,7 @@ static struct sbp_target_request *sbp_mgt_get_req(struct sbp_session *sess,
                return ERR_PTR(-ENOMEM);
 
        req = &((struct sbp_target_request *)se_sess->sess_cmd_map)[tag];
+       memset(req, 0, sizeof(*req));
        req->se_cmd.map_tag = tag;
        req->se_cmd.tag = next_orb;
 
@@ -1619,12 +1620,8 @@ static void sbp_mgt_agent_rw(struct fw_card *card,
                        rcode = RCODE_CONFLICT_ERROR;
                        goto out;
                }
-               // XXX:
-#if 0
-               req = sbp_mgt_get_req(agent->login->sess, card);
-#else
+
                req = kzalloc(sizeof(*req), GFP_ATOMIC);
-#endif
                if (!req) {
                        rcode = RCODE_CONFLICT_ERROR;
                        goto out;

I hope Thunderbird hasn't mangled this too badly.

With this applied, please add this to the patch for sbp_target:

Acked-by: Chris Boot <bootc@bootc.net>

Thanks,
Chris

-- 
Chris Boot
bootc@bootc.net
