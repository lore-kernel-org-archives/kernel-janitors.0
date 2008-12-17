From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 17 Dec 2008 07:02:52 +0000
Subject: Re: [PATCH 2/11] drivers/infiniband: Move a dereference below a NULL test
Message-Id: <ada7i5z1dyb.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812161611540.20444@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812161611540.20444@pc-004.diku.dk> (Julia
	Lawall's message of "Tue, 16 Dec 2008 16:12:16 +0100 (CET)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

 > --- a/drivers/infiniband/hw/nes/nes_cm.c
 > +++ b/drivers/infiniband/hw/nes/nes_cm.c
 > @@ -376,13 +376,14 @@ int schedule_nes_timer(struct nes_cm_node *cm_node, struct sk_buff *skb,
 >  		int close_when_complete)
 >  {
 >  	unsigned long  flags;
 > -	struct nes_cm_core *cm_core = cm_node->cm_core;
 > +	struct nes_cm_core *cm_core;
 >  	struct nes_timer_entry *new_send;
 >  	int ret = 0;
 >  	u32 was_timer_set;
 >  
 >  	if (!cm_node)
 >  		return -EINVAL;
 > +	cm_core = cm_node->cm_core;

Thanks... I believe this is already taken care of by a patch pending for
2.6.29 (which should be in -next) that removes the test for NULL.

 - R.
