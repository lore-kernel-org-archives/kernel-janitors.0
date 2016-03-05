From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Sat, 05 Mar 2016 09:33:14 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR
Message-Id: <1457170394.19657.291.camel@haakon3.risingtidesystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302100912.GD5533@mwanda>
	 <1457163214.19657.288.camel@haakon3.risingtidesystems.com>
	 <2A1ED37C-C556-4B3D-A59B-3369E5DFB4D5@bootc.net>
In-Reply-To: <2A1ED37C-C556-4B3D-A59B-3369E5DFB4D5@bootc.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chris Boot <bootc@bootc.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2016-03-05 at 08:45 +0000, Chris Boot wrote:
> On 5 Mar 2016, at 07:33, Nicholas A. Bellinger <nab@linux-iscsi.org> wrote:
> > 
> > Hi Dan + BootC,
> > 
> > On Wed, 2016-03-02 at 13:09 +0300, Dan Carpenter wrote:
> >> We changed this from kzalloc to sbp_mgt_get_req() so we need to change
> >> from checking for NULL to check for error pointers.
> >> 
> >> Fixes: c064b2a78989 ('sbp-target: Conversion to percpu_ida tag pre-allocation')
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> 
> >> diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
> >> index 251d532..a04b0605f 100644
> >> --- a/drivers/target/sbp/sbp_target.c
> >> +++ b/drivers/target/sbp/sbp_target.c
> >> @@ -951,7 +951,7 @@ static void tgt_agent_fetch_work(struct work_struct *work)
> >> 
> >> 	while (next_orb && tgt_agent_check_active(agent)) {
> >> 		req = sbp_mgt_get_req(sess, sess->card, next_orb);
> >> -		if (!req) {
> >> +		if (IS_ERR(req)) {
> >> 			spin_lock_bh(&agent->lock);
> >> 			agent->state = AGENT_STATE_DEAD;
> >> 			spin_unlock_bh(&agent->lock);
> > 
> > Fixed + folded into the original patch.
> > 
> > Thanks Dan.
> > 
> > Chris, would you be so kind to review the original changes here:
> > 
> > sbp-target: Conversion to percpu_ida tag pre-allocation
> > http://www.spinics.net/lists/target-devel/msg11778.html
> > 
> > sbp-target: Convert to TARGET_SCF_ACK_KREF I/O krefs
> > http://www.spinics.net/lists/target-devel/msg11780.html
> > 
> > and verify on your local IEEE1394 target setup..?
> 
> Hi Nic, Dan,
> 
> I’m away this weekend so I can’t test these for a few days at least,
> unfortunately. I must admit I only vaguely follow the changes here as
> I haven’t been keeping up with the pace of change in target-devel
> lately, but it generally looks OK I think.
> 
> Are these in linux-next or another branch somewhere I can easily clone
> them from?

The patch series is in target-pending/for-next.

> 
> How soon do you need my ACK/NAK on these?
> 

Assuming the merge window opens on the 13th, any time over the next 7-10
days would be fine.

