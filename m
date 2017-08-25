From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 10:36:15 +0000
Subject: [PATCH] um: remove a stray tab
Message-Id: <20170825103615.spltju4nkooc3acf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Static checkers would urge us to add curly braces to this code, but
actually the code works correctly.  It just isn't indented right.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/um/os-Linux/tls.c b/arch/x86/um/os-Linux/tls.c
index 9d94b3b76c74..ed8ea90967dc 100644
--- a/arch/x86/um/os-Linux/tls.c
+++ b/arch/x86/um/os-Linux/tls.c
@@ -37,7 +37,7 @@ void check_host_supports_tls(int *supports_tls, int *tls_min)
 				continue;
 			else if (errno = ENOSYS)
 				*supports_tls = 0;
-				return;
+			return;
 		}
 	}
 
