From: Joonwon Kang <kjw1627@gmail.com>
Date: Wed, 31 Jul 2019 18:01:10 +0000
Subject: [PATCH 1/2] randstruct: fix a bug in is_pure_ops_struct()
Message-Id: <2ba5ebfa2c622ece4952b5068b4154213794e5c4.1564595346.git.kjw1627@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564595346.git.kjw1627@gmail.com>
In-Reply-To: <cover.1564595346.git.kjw1627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: keescook@chromium.org
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

Before this, there were false negatives in the case where a struct
contains other structs which contain only function pointers because
of unreachable code in is_pure_ops_struct().

Signed-off-by: Joonwon Kang <kjw1627@gmail.com>
---
 scripts/gcc-plugins/randomize_layout_plugin.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
index 6d5bbd31db7f..bd29e4e7a524 100644
--- a/scripts/gcc-plugins/randomize_layout_plugin.c
+++ b/scripts/gcc-plugins/randomize_layout_plugin.c
@@ -443,13 +443,13 @@ static int is_pure_ops_struct(const_tree node)
 		if (node = fieldtype)
 			continue;
 
-		if (!is_fptr(fieldtype))
-			return 0;
-
-		if (code != RECORD_TYPE && code != UNION_TYPE)
+		if (code = RECORD_TYPE || code = UNION_TYPE) {
+			if (!is_pure_ops_struct(fieldtype))
+				return 0;
 			continue;
+		}
 
-		if (!is_pure_ops_struct(fieldtype))
+		if (!is_fptr(fieldtype))
 			return 0;
 	}
 
-- 
2.17.1
