From: Dan Carpenter <error27@gmail.com>
Date: Sat, 17 Jul 2010 10:26:08 +0000
Subject: [patch] auditsc: audit_log_single_execve_arg() returns signed
Message-Id: <20100717102608.GE17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"len" needs to be signed because audit_log_single_execve_arg() returns
-1 and we want to check for that:

                len = audit_log_single_execve_arg(context, ab, i,
                                                  &len_sent, p, buf);
                if (len <= 0)
                        break;

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 3828ad5..2c060c3 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1158,7 +1158,8 @@ static void audit_log_execve_info(struct audit_context *context,
 				  struct audit_aux_data_execve *axi)
 {
 	int i;
-	size_t len, len_sent = 0;
+	ssize_t len;
+	size_t len_sent = 0;
 	const char __user *p;
 	char *buf;
 
