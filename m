From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 12:36:48 +0000
Subject: [PATCH 2/3] Documentation-getdelays: Apply a recommendation from "checkpatch.pl" in main()
Message-Id: <567BE6E0.6040405@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567BE5AA.6070607@users.sourceforge.net>
In-Reply-To: <567BE5AA.6070607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 11:05:32 +0100

The script "checkpatch.pl" pointed out that assignments should usually
not be performed within condition checks.
Thus move the assignment for the variable "nl_sd" to a separate statement.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 Documentation/accounting/getdelays.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/accounting/getdelays.c b/Documentation/accounting/getdelays.c
index 6656c0c..9ca318d 100644
--- a/Documentation/accounting/getdelays.c
+++ b/Documentation/accounting/getdelays.c
@@ -375,7 +375,8 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if ((nl_sd = create_nl_socket(NETLINK_GENERIC)) < 0)
+	nl_sd = create_nl_socket(NETLINK_GENERIC);
+	if (nl_sd < 0)
 		err(1, "error creating Netlink socket\n");
 
 
-- 
2.6.3

