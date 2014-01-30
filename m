From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:52:26 +0000
Subject: re: VMCI: queue pairs implementation.
Message-Id: <20140130115226.GD12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130110193238.GB17997@elgon.mountain>
In-Reply-To: <20130110193238.GB17997@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello George Zhang,

The patch 06164d2b72aa: "VMCI: queue pairs implementation." from Jan
8, 2013, leads to the following static checker warning:

	drivers/misc/vmw_vmci/vmci_queue_pair.c:1145 qp_detatch_guest_work()
	warn: we tested 'entry' before and it was 'true'"

drivers/misc/vmw_vmci/vmci_queue_pair.c
  1140          entry->qp.ref_count--;
  1141          if (entry->qp.ref_count = 0)
  1142                  qp_list_remove_entry(&qp_guest_endpoints, &entry->qp);
  1143  
  1144          /* If we didn't remove the entry, this could change once we unlock. */
  1145          if (entry)
                    ^^^^^
This can never happen.  The comment makes me think we intended to test
something else, but I'm not sure what?

  1146                  ref_count = entry->qp.ref_count;
  1147  
  1148          mutex_unlock(&qp_guest_endpoints.mutex);

regards,
dan carpenter

