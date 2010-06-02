From: Dan Carpenter <error27@gmail.com>
Date: Wed, 02 Jun 2010 20:41:47 +0000
Subject: Re: [announce] smatch 1.54
Message-Id: <20100602204147.GO5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100109085325.GE7840@bicker> <adahblls0kx.fsf@roland-alpha.cisco.com>
In-Reply-To: <adahblls0kx.fsf@roland-alpha.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 02, 2010 at 12:20:46PM -0700, Roland Dreier wrote:
> Hi Dan,
> 
> I'm trying out smatch on some kernel code now.  Neat stuff, but I'm
> seeing some puzzling false positives relating to signedness.

Hm...  Apparently the bug is caused because I don't understand sparse
internals very well.  The following patch takes care of it, but I'll
need to look at it some more to make sure it's complete.

diff --git a/smatch_type.c b/smatch_type.c
index 8896c3a..afbbe68 100644
--- a/smatch_type.c
+++ b/smatch_type.c
@@ -14,12 +14,22 @@
 
 #include "smatch.h"
 
+struct symbol *get_real_base_type(struct symbol *sym)
+{
+	struct symbol *ret;
+
+	ret = get_base_type(sym);
+	if (ret->type = SYM_RESTRICT)
+		return get_real_base_type(ret);
+	return ret;
+}
+
 static struct symbol *get_type_symbol(struct expression *expr)
 {
 	if (!expr || expr->type != EXPR_SYMBOL || !expr->symbol)
 		return NULL;
 
-	return get_base_type(expr->symbol);
+	return get_real_base_type(expr->symbol);
 }
 
 static struct symbol *get_symbol_from_deref(struct expression *expr)
@@ -38,10 +48,10 @@ static struct symbol *get_symbol_from_deref(struct expression *expr)
 		return NULL;
 	}
 	if (struct_sym->type = SYM_PTR)
-		struct_sym = get_base_type(struct_sym);
+		struct_sym = get_real_base_type(struct_sym);
 	FOR_EACH_PTR(struct_sym->symbol_list, tmp) {
 		if (tmp->ident = member)
-			return get_base_type(tmp);
+			return get_real_base_type(tmp);
 	} END_FOR_EACH_PTR(tmp);
 	return NULL;
 }
@@ -53,7 +63,7 @@ static struct symbol *get_return_type(struct expression *expr)
 	tmp = get_type(expr->fn);
 	if (!tmp)
 		return NULL;
-	return get_base_type(tmp);
+	return get_real_base_type(tmp);
 }
 
 static struct symbol *get_pointer_type(struct expression *expr)
@@ -63,7 +73,7 @@ static struct symbol *get_pointer_type(struct expression *expr)
 	sym = get_type(expr);
 	if (!sym || sym->type != SYM_PTR)
 		return NULL;
-	return get_base_type(sym);
+	return get_real_base_type(sym);
 }
 
 static struct symbol *fake_pointer_sym(struct expression *expr)
@@ -102,14 +112,14 @@ struct symbol *get_type(struct expression *expr)
 	case EXPR_CAST:
 	case EXPR_FORCE_CAST:
 	case EXPR_IMPLIED_CAST:
-		return get_base_type(expr->cast_type);
+		return get_real_base_type(expr->cast_type);
 	case EXPR_BINOP:
 		if (expr->op != '+')
 			return NULL;
 		tmp = get_type(expr->left);
 		if (!tmp || (tmp->type != SYM_ARRAY && tmp->type != SYM_PTR))
 			return NULL;
-		return get_base_type(tmp);
+		return get_real_base_type(tmp);
 	case EXPR_CALL:
 		return get_return_type(expr);
 	default:


