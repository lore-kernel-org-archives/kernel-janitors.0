From: "Steve Wise" <swise@opengridcomputing.com>
Date: Thu, 13 Jul 2017 14:34:33 +0000
Subject: RE: [PATCH] cxgb4: Fix error codes in c4iw_create_cq()
Message-Id: <005601d2fbe5$25243c60$6f6cb520$@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713074740.4i2weowvndudqwh6@mwanda>
In-Reply-To: <20170713074740.4i2weowvndudqwh6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: 'Doug Ledford' <dledford@redhat.com>, 'Sean Hefty' <sean.hefty@intel.com>, 'Hal Rosenstock' <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

> 
> If one of these kmalloc() calls fails then we return ERR_PTR(0) which is
> NULL.  It results in a NULL dereference in the callers.
> 
> Fixes: cfdda9d76436 ("RDMA/cxgb4: Add driver for Chelsio T4 RNIC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Steve Wise <swise@opengridcomputing.com>


