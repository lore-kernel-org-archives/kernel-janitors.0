From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Wed, 29 Oct 2008 08:18:09 +0000
Subject: [PATCH] : Fix compilation warnings in net/netlabel/netlabel_addrlist.c
Message-Id: <ea11fea30810290106u3f92268q62226da65db6f6a4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810141121w58e25b43x92d71ca800c5c96@mail.gmail.com>
In-Reply-To: <ea11fea30810141121w58e25b43x92d71ca800c5c96@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, paul.moore@hp.com
Cc: mkatiyar@gmail.com

Below patch fixes the following warning.
net/netlabel/netlabel_addrlist.c:335: warning: unused variable 'dir'
net/netlabel/netlabel_addrlist.c:369: warning: unused variable 'dir'


Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 net/netlabel/netlabel_addrlist.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/net/netlabel/netlabel_addrlist.c b/net/netlabel/netlabel_addrlist.c
index b0925a3..65fbec1 100644
--- a/net/netlabel/netlabel_addrlist.c
+++ b/net/netlabel/netlabel_addrlist.c
@@ -332,7 +332,9 @@ void netlbl_af4list_audit_addr(struct audit_buffer
*audit_buf,
 					__be32 addr, __be32 mask)
 {
 	u32 mask_val = ntohl(mask);
+#ifdef CONFIG_AUDIT
 	char *dir = (src ? "src" : "dst");
+#endif

 	if (dev != NULL)
 		audit_log_format(audit_buf, " netif=%s", dev);
@@ -366,7 +368,9 @@ void netlbl_af6list_audit_addr(struct audit_buffer
*audit_buf,
 				 const struct in6_addr *addr,
 				 const struct in6_addr *mask)
 {
+#ifdef CONFIG_AUDIT
 	char *dir = (src ? "src" : "dst");
+#endif

 	if (dev != NULL)
 		audit_log_format(audit_buf, " netif=%s", dev);
-- 
1.5.4.3


Thanks -
Manish
