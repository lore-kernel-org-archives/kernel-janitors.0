From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 May 2013 16:13:49 +0000
Subject: [patch] svcauth_gss: fix error code in use_gss_proxy()
Message-Id: <20130511161349.GA20451@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, Simo Sorce <simo@redhat.com>, Stanislav Kinsbursky <skinsbursky@parallels.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return zero on success and -EBUSY on error so the type
needs to be int instead of bool.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/auth_gss/svcauth_gss.c b/net/sunrpc/auth_gss/svcauth_gss.c
index 871c73c..2c6a1ec 100644
--- a/net/sunrpc/auth_gss/svcauth_gss.c
+++ b/net/sunrpc/auth_gss/svcauth_gss.c
@@ -1287,7 +1287,7 @@ static bool use_gss_proxy(struct net *net)
 
 #ifdef CONFIG_PROC_FS
 
-static bool set_gss_proxy(struct net *net, int type)
+static int set_gss_proxy(struct net *net, int type)
 {
 	struct sunrpc_net *sn = net_generic(net, sunrpc_net_id);
 	int ret = 0;
