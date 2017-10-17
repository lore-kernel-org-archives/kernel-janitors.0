From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 20:42:51 +0000
Subject: [bug report] mqprio: Introduce new hardware offload mode and shaper in mqprio
Message-Id: <20171017204251.nwbpjuss5gcmuo7m@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Amritha Nambiar,

This is a semi-automatic email about new static checker warnings.

The patch 4e8b86c06269: "mqprio: Introduce new hardware offload mode 
and shaper in mqprio" from Sep 7, 2017, leads to the following Smatch 
complaint:

net/sched/sch_mqprio.c:156 mqprio_init()
	 warn: variable dereferenced before check 'opt' (see line 145)

net/sched/sch_mqprio.c
   144		int rem;
   145		int len = nla_len(opt) - NLA_ALIGN(sizeof(*qopt));
                          ^^^^^^^^^^^
Patch adds new dereference.

   146	
   147		BUILD_BUG_ON(TC_MAX_QUEUE != TC_QOPT_MAX_QUEUE);
   148		BUILD_BUG_ON(TC_BITMASK != TC_QOPT_BITMASK);
   149	
   150		if (sch->parent != TC_H_ROOT)
   151			return -EOPNOTSUPP;
   152	
   153		if (!netif_is_multiqueue(dev))
   154			return -EOPNOTSUPP;
   155	
   156		if (!opt || nla_len(opt) < sizeof(*qopt))
                    ^^^^
The old code checked for NULL.  You also might want to consider changing
the "|| nla_len(opt) < sizeof(*qopt)" to:
    "|| nla_len(opt) < NLA_ALIGN(sizeof(*qopt))", just for consistency.

   157			return -EINVAL;
   158	

regards,
dan carpenter
