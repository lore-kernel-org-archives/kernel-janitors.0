From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 17 Aug 2012 07:46:56 +0000
Subject: [PATCH 1/3] drivers/net/wimax/i2400m/fw.c: fix error return code
Message-Id: <1345189618-13758-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345189618-13758-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345189618-13758-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-wimax@intel.com, wimax@linuxwimax.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e1,e2;
@@

if (ret < 0)
 { ... return ret; }
 ... when != ret = e1
     when forall
*if(...)
 {
  ... when != ret = e2
* return ret;
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wimax/i2400m/fw.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wimax/i2400m/fw.c b/drivers/net/wimax/i2400m/fw.c
index 283237f..def12b3 100644
--- a/drivers/net/wimax/i2400m/fw.c
+++ b/drivers/net/wimax/i2400m/fw.c
@@ -326,8 +326,10 @@ int i2400m_barker_db_init(const char *_options)
 		unsigned barker;
 
 		options_orig = kstrdup(_options, GFP_KERNEL);
-		if (options_orig = NULL)
+		if (options_orig = NULL) {
+			result = -ENOMEM;
 			goto error_parse;
+		}
 		options = options_orig;
 
 		while ((token = strsep(&options, ",")) != NULL) {

