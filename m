From: Joonwon Kang <kjw1627@gmail.com>
Date: Wed, 31 Jul 2019 18:01:49 +0000
Subject: [PATCH 2/2] randstruct: remove dead code in is_pure_ops_struct()
Message-Id: <281a65cc361512e3dc6c5deffa324f800eb907be.1564595346.git.kjw1627@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564595346.git.kjw1627@gmail.com>
In-Reply-To: <cover.1564595346.git.kjw1627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: keescook@chromium.org
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

Recursive declaration for struct which has member of the same struct
type, for example,

struct foo {
    struct foo f;
    ...
};

is not allowed. So, it is unnecessary to check if a struct has this
kind of member.

Signed-off-by: Joonwon Kang <kjw1627@gmail.com>
---
 scripts/gcc-plugins/randomize_layout_plugin.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
index bd29e4e7a524..e14efe23e645 100644
--- a/scripts/gcc-plugins/randomize_layout_plugin.c
+++ b/scripts/gcc-plugins/randomize_layout_plugin.c
@@ -440,9 +440,6 @@ static int is_pure_ops_struct(const_tree node)
 		const_tree fieldtype = get_field_type(field);
 		enum tree_code code = TREE_CODE(fieldtype);
 
-		if (node = fieldtype)
-			continue;
-
 		if (code = RECORD_TYPE || code = UNION_TYPE) {
 			if (!is_pure_ops_struct(fieldtype))
 				return 0;
-- 
2.17.1
