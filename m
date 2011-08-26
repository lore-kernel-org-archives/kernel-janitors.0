From: Dan Carpenter <error27@gmail.com>
Date: Fri, 26 Aug 2011 16:57:40 +0000
Subject: [patch 2/2] 9p: change an int to unsigned int
Message-Id: <20110826165740.GF3775@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Venkateswararao Jujjuri (JV)" <jvrao@linux.vnet.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "M. Mohan Kumar" <mohan@in.ibm.com>, Stephen Hemminger <shemminger@vyatta.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

The size of things should be unsigned because negative sizes are
silly.  My concern is the the limit checks don't take negative values
into consideration in p9_client_create()
	if (clnt->msize > clnt->trans_mod->maxsize)
		clnt->msize = clnt->trans_mod->maxsize;
and in p9_tag_alloc()
	int alloc_msize = min(c->msize, max_size);

I don't know if this is exported to user space?  Hopefully it's not
too late to change this.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 55ce72c..d479d7d 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -151,7 +151,7 @@ struct p9_req_t {
 
 struct p9_client {
 	spinlock_t lock; /* protect client structure */
-	int msize;
+	unsigned int msize;
 	unsigned char proto_version;
 	struct p9_trans_module *trans_mod;
 	enum p9_trans_status status;
