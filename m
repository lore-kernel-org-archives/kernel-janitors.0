From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Sep 2013 12:29:23 +0000
Subject: re: bnx2x: VF RSS support - PF side
Message-Id: <20130909122923.GA11943@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ariel Elior,

This is a semi-automatic email about new static checker warnings.

The patch b9871bcfd211: "bnx2x: VF RSS support - PF side" from Sep 4, 
2013, leads to the following Smatch complaint:

drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:474 bnx2x_vfop_qdtor_cmd()
	 error: we previously assumed 'vfop' could be null (see line 459)

drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c
   458	
   459		if (vfop) {
                    ^^^^
Existing check.

   460			struct bnx2x_queue_state_params *qstate    461				&vf->op_params.qctor.qstate;
   462	
   463			memset(qstate, 0, sizeof(*qstate));
   464			qstate->q_obj = &bnx2x_vfq(vf, qid, sp_obj);
   465	
   466			vfop->args.qdtor.qid = qid;
   467			vfop->args.qdtor.cxt = bnx2x_vfq(vf, qid, cxt);
   468	
   469			bnx2x_vfop_opset(BNX2X_VFOP_QDTOR_HALT,
   470					 bnx2x_vfop_qdtor, cmd->done);
   471			return bnx2x_vfop_transition(bp, vf, bnx2x_vfop_qdtor,
   472						     cmd->block);
   473		}
   474		DP(BNX2X_MSG_IOV, "VF[%d] failed to add a vfop. rc %d\n",
   475		   vf->abs_vfid, vfop->rc);
                                 ^^^^^^^^
Patch adds dereference.

   476		return -ENOMEM;

regards,
dan carpenter
