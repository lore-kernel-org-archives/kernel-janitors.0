From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 09:35:42 +0000
Subject: [patch] rtnetlink: remove an unneeded test
Message-Id: <20130814093542.GC521@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: John Fastabend <john.r.fastabend@intel.com>, Jiri Pirko <jiri@resnulli.us>, Vlad Yasevich <vyasevic@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We know that "dev" is a valid pointer at this point, so we can remove
the test and clean up a little.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 618dbe4..e7e058e 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1867,10 +1867,10 @@ replay:
 		else
 			err = register_netdevice(dev);
 
-		if (err < 0 && !IS_ERR(dev))
+		if (err < 0) {
 			free_netdev(dev);
-		if (err < 0)
 			goto out;
+		}
 
 		err = rtnl_configure_link(dev, ifm);
 		if (err < 0)
