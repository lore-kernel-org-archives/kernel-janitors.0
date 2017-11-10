From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:48:10 +0000
Subject: [PATCH 2/4] ASN.1: Improve exiting from parse_type()
Message-Id: <6fd7f347-cdbb-9a0e-9817-8a35b262d8a6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
In-Reply-To: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 11:21:13 +0100

* Add a jump target so that a call of the function "exit" is stored
  only once at the end of this function.

* Replace nine calls by goto statements.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/asn1_compiler.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index e37e5ef3fabb..0eea270fcaef 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -896,7 +896,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		default:
 			fprintf(stderr, "%s:%d: Unrecognised tag class token '%s'\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 
 		if (cursor >= end)
@@ -904,7 +904,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (cursor->token_type != TOKEN_NUMBER) {
 			fprintf(stderr, "%s:%d: Missing tag number '%s'\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 
 		element->tag &= ~0x1f;
@@ -919,7 +919,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (cursor->token_type != TOKEN_CLOSE_SQUARE) {
 			fprintf(stderr, "%s:%d: Missing closing square bracket '%s'\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 		cursor++;
 		if (cursor >= end)
@@ -1020,7 +1020,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (!ref) {
 			fprintf(stderr, "%s:%d: Type '%s' undefined\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 		cursor->type = *ref;
 		(*ref)->ref_count++;
@@ -1070,7 +1070,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 	default:
 		fprintf(stderr, "%s:%d: Token '%s' does not introduce a type\n",
 			filename, cursor->line, cursor->content);
-		exit(1);
+		goto exit;
 	}
 
 	/* Handle elements that are optional */
@@ -1088,13 +1088,13 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (cursor->token_type != TOKEN_ELEMENT_NAME) {
 			fprintf(stderr, "%s:%d: Token '%s' is not an action function name\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 
 		action = malloc(sizeof(struct action));
 		if (!action) {
 			perror(NULL);
-			exit(1);
+			goto exit;
 		}
 		action->index = 0;
 		action->name = cursor->content;
@@ -1129,7 +1129,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (cursor->token_type != TOKEN_CLOSE_ACTION) {
 			fprintf(stderr, "%s:%d: Missing close action, got '%s'\n",
 				filename, cursor->line, cursor->content);
-			exit(1);
+			goto exit;
 		}
 		cursor++;
 	}
@@ -1140,10 +1140,11 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 parse_error:
 	fprintf(stderr, "%s:%d: Unexpected token '%s'\n",
 		filename, cursor->line, cursor->content);
-	exit(1);
+	goto exit;
 
 overrun_error:
 	fprintf(stderr, "%s: Unexpectedly hit EOF\n", filename);
+exit:
 	exit(1);
 }
 
-- 
2.15.0

