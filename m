From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Mar 2018 09:12:31 +0000
Subject: [PATCH] apparmor: Fix an error code in verify_table_headers()
Message-Id: <20180319091231.GA7409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

We accidentally return a positive EPROTO instead of a negative -EPROTO.
Since 71 is not an error pointer, that means it eventually results in an
Oops in the caller.

Fixes: d901d6a298dc ("apparmor: dfa split verification of table headers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index dd4c995c5e25..280eba082c7b 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -198,7 +198,7 @@ static int verify_table_headers(struct table_header **tables, int flags)
 static int verify_dfa(struct aa_dfa *dfa)
 {
 	size_t i, state_count, trans_count;
-	int error = EPROTO;
+	int error = -EPROTO;
 
 	state_count = dfa->tables[YYTD_ID_BASE]->td_lolen;
 	trans_count = dfa->tables[YYTD_ID_NXT]->td_lolen;
