From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 10:19:58 +0000
Subject: [PATCH] um: return negative in tuntap_open_tramp()
Message-Id: <20170825092416.p53hs2f4gcwataen@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The intention is to return negative error codes.  "pid" is already
negative but we accidentally negate it again back to positive.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested!  Please review carefully.

diff --git a/arch/um/os-Linux/drivers/tuntap_user.c b/arch/um/os-Linux/drivers/tuntap_user.c
index c2e6e1dad876..db24ce0d09a6 100644
--- a/arch/um/os-Linux/drivers/tuntap_user.c
+++ b/arch/um/os-Linux/drivers/tuntap_user.c
@@ -80,7 +80,7 @@ static int tuntap_open_tramp(char *gate, int *fd_out, int me, int remote,
 	pid = run_helper(tuntap_pre_exec, &data, argv);
 
 	if (pid < 0)
-		return -pid;
+		return pid;
 
 	close(remote);
 
