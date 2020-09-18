From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 10:24:34 +0000
Subject: [bug report] ionic: dynamic interrupt moderation
Message-Id: <20200918102434.GA892838@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Shannon Nelson,

This is a semi-automatic email about new static checker warnings.

The patch 04a834592bf5: "ionic: dynamic interrupt moderation" from 
Sep 15, 2020, leads to the following Smatch complaint:

    drivers/net/ethernet/pensando/ionic/ionic_lif.c:855 ionic_adminq_napi()
    error: we previously assumed 'lif->adminqcq' could be null (see line 848)

drivers/net/ethernet/pensando/ionic/ionic_lif.c
   847	
   848		if (lif->adminqcq && lif->adminqcq->flags & IONIC_QCQ_F_INITED)
                    ^^^^^^^^^^^^^
Existing code checks for NULL

   849			a_work = ionic_cq_service(&lif->adminqcq->cq, budget,
   850						  ionic_adminq_service, NULL, NULL);
   851	
   852		work_done = max(n_work, a_work);
   853		if (work_done < budget && napi_complete_done(napi, work_done)) {
   854			flags |= IONIC_INTR_CRED_UNMASK;
   855			lif->adminqcq->cq.bound_intr->rearm_count++;
                        ^^^^^^^^^^^^^^^
The patch adds a new unchecked dereference

   856		}
   857	

regards,
dan carpenter
