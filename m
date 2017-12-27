From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:38 +0000
Subject: [PATCH 05/12] openvswitch: drop unneeded newline
Message-Id: <1514386305-7402-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pravin Shelar <pshelar@nicira.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org

OVS_NLERR prints a newline at the end of the message string, so the
message string does not need to include a newline explicitly.  Done
using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/openvswitch/conntrack.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/openvswitch/conntrack.c b/net/openvswitch/conntrack.c
index b27c5c6..62f36cc9 100644
--- a/net/openvswitch/conntrack.c
+++ b/net/openvswitch/conntrack.c
@@ -1266,14 +1266,14 @@ static int parse_nat(const struct nlattr *attr,
 		/* Do not allow flags if no type is given. */
 		if (info->range.flags) {
 			OVS_NLERR(log,
-				  "NAT flags may be given only when NAT range (SRC or DST) is also specified.\n"
+				  "NAT flags may be given only when NAT range (SRC or DST) is also specified."
 				  );
 			return -EINVAL;
 		}
 		info->nat = OVS_CT_NAT;   /* NAT existing connections. */
 	} else if (!info->commit) {
 		OVS_NLERR(log,
-			  "NAT attributes may be specified only when CT COMMIT flag is also specified.\n"
+			  "NAT attributes may be specified only when CT COMMIT flag is also specified."
 			  );
 		return -EINVAL;
 	}

