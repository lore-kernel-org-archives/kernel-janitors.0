From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2013 19:32:39 +0000
Subject: re: VMCI: queue pairs implementation.
Message-Id: <20130110193238.GB17997@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello George Zhang,

This is a semi-automatic email about new static checker warnings.

The patch 06164d2b72aa: "VMCI: queue pairs implementation." from Jan
8, 2013, leads to the following Smatch complaint:

drivers/misc/vmw_vmci/vmci_queue_pair.c:3356 vmci_qpair_dequev()
	 warn: variable dereferenced before check 'qpair' (see line 3354)

drivers/misc/vmw_vmci/vmci_queue_pair.c
  3353	
  3354		qp_lock(qpair);
                        ^^^^^^
dereference.

  3355	
  3356		if (!qpair || !iov)
                     ^^^^^
test.

  3357			return VMCI_ERROR_INVALID_ARGS;
  3358	

regards,
dan carpenter
