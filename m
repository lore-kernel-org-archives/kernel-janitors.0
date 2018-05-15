From: Colin King <colin.king@canonical.com>
Date: Tue, 15 May 2018 09:02:09 +0000
Subject: [PATCH][next] scripts/dtc: fix spelling mistake: "endpont" -> "endpoint"
Message-Id: <20180515090209.9165-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in FAIL message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/dtc/checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index a2cc1036c915..9d253819e12c 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1536,7 +1536,7 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
-		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
+		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
 
 	check_graph_reg(c, dti, node);
 
-- 
2.17.0

