From: Manish Katiyar <mkatiyar@gmail.com>
Date: Thu, 19 Feb 2009 09:16:52 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30902190104u366afb90yfbcf48ed2c7585c9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 18, 2009 at 10:47 PM, Stefan Richter
<stefanr@s5r6.in-berlin.de> wrote:
> Manish Katiyar wrote:
>> On Wed, Feb 18, 2009 at 9:53 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>>> On Wed, Feb 18, 2009 at 08:49:21PM +0530, Manish Katiyar wrote:
>>>> I am bit confused, apparently it looks like change in comments is
>>>> causing md5sum to change. See the output below.
>>> Thats because your change add an extra line. And __LINE__ is used
>>> by BUG_ON later in the file - so now it sees a new line numbers
>>> and thus md5 sum changes.
>>
>> Ohhh.......thanks a lot Sam, I would have never guessed that. Till now
>> I always felt comments are harmless. In that case should I split them
>> in a separate patch even if they are just simple changes in comments ?
>
> Such a split makes only sense in larger patches where the md5sum check
> helps easing the mind of reviewers.  A flood of trivial patches is not
> very welcome either.
>
> BTW, if you start adjusting the style of comments in this file, then I
> suggest you change all multi-line comments to the canonical style in one
> go.  Replacing one style deviation by another deviation like in
> <ea11fea30902180719w34e5597ufdeb25bcb183e301@mail.gmail.com> doesn't
> make sense.

Resending the patch :

Patch to fix coding style whitespace issues and replace __initcall
with device_initcall. Fixed multi-line comments as per coding style.

Errors as reported by checkpatch.pl :-
Before:
total: 14 errors, 14 warnings, 487 lines checked
After :
total: 0 errors, 8 warnings, 507 lines checked

Compile tested binary verified as :-
Before:
 text    data     bss     dec     hex filename
  2405       4       0    2409     969 kernel/kallsyms.o
After :
 text     data     bss     dec     hex filename
  2405       4       0    2409     969 kernel/kallsyms.o


Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 kernel/kallsyms.c |   96 ++++++++++++++++++++++++++++++++---------------------
 1 files changed, 58 insertions(+), 38 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 7b8b0f2..3bc6c5b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -30,11 +30,15 @@
 #define all_var 0
 #endif

-/* These will be re-linked against their real values during the
second link stage */
+/*
+ * These will be re-linked against their real values
+ * during the second link stage
+ */
 extern const unsigned long kallsyms_addresses[] __attribute__((weak));
 extern const u8 kallsyms_names[] __attribute__((weak));

-/* tell the compiler that the count isn't in the small data section if the arch
+/*
+ * tell the compiler that the count isn't in the small data section if the arch
  * has one (eg: FRV)
  */
 extern const unsigned long kallsyms_num_syms
@@ -75,8 +79,10 @@ static int is_ksym_addr(unsigned long addr)
 	return is_kernel_text(addr) || is_kernel_inittext(addr);
 }

-/* expand a compressed symbol data into the resulting uncompressed string,
-   given the offset to where the symbol is in the compressed stream */
+/*
+ * expand a compressed symbol data into the resulting uncompressed string,
+ * given the offset to where the symbol is in the compressed stream
+ */
 static unsigned int kallsyms_expand_symbol(unsigned int off, char *result)
 {
 	int len, skipped_first = 0;
@@ -87,19 +93,23 @@ static unsigned int
kallsyms_expand_symbol(unsigned int off, char *result)
 	len = *data;
 	data++;

-	/* update the offset to return the offset for the next symbol on
-	 * the compressed stream */
+	/*
+	 * update the offset to return the offset for the next symbol on
+	 * the compressed stream
+	 */
 	off += len + 1;

-	/* for every byte on the compressed symbol data, copy the table
-	   entry for that byte */
-	while(len) {
-		tptr = &kallsyms_token_table[ kallsyms_token_index[*data] ];
+	/*
+	 * for every byte on the compressed symbol data, copy the table
+	 * entry for that byte
+	 */
+	while (len) {
+		tptr = &kallsyms_token_table[kallsyms_token_index[*data]];
 		data++;
 		len--;

 		while (*tptr) {
-			if(skipped_first) {
+			if (skipped_first) {
 				*result = *tptr;
 				result++;
 			} else
@@ -114,32 +124,42 @@ static unsigned int
kallsyms_expand_symbol(unsigned int off, char *result)
 	return off;
 }

-/* get symbol type information. This is encoded as a single char at the
- * begining of the symbol name */
+/*
+ * get symbol type information. This is encoded as a single char at the
+ * begining of the symbol name
+ */
 static char kallsyms_get_symbol_type(unsigned int off)
 {
-	/* get just the first code, look it up in the token table, and return the
-	 * first char from this token */
-	return kallsyms_token_table[ kallsyms_token_index[ kallsyms_names[off+1] ] ];
+	/*
+	 * get just the first code, look it up in the token table,
+	 * and return the first char from this token
+	 */
+	return kallsyms_token_table[kallsyms_token_index[kallsyms_names[off + 1]]];
 }


-/* find the offset on the compressed stream given and index in the
- * kallsyms array */
+/*
+ * find the offset on the compressed stream given and index in the
+ * kallsyms array
+ */
 static unsigned int get_symbol_offset(unsigned long pos)
 {
 	const u8 *name;
 	int i;

-	/* use the closest marker we have. We have markers every 256 positions,
-	 * so that should be close enough */
-	name = &kallsyms_names[ kallsyms_markers[pos>>8] ];
+	/*
+	 * use the closest marker we have. We have markers every 256 positions,
+	 * so that should be close enough
+	 */
+	name = &kallsyms_names[kallsyms_markers[pos >> 8]];

-	/* sequentially scan all the symbols up to the point we're searching for.
-	 * Every symbol is stored in a [<len>][<len> bytes of data] format, so we
-	 * just need to add the len to the current pointer for every symbol we
-	 * wish to skip */
-	for(i = 0; i < (pos&0xFF); i++)
+	/*
+	 * sequentially scan all the symbols up to the point we're searching for
+	 * Every symbol is stored in a [<len>][<len> bytes of data] format, so
+	 * we just need to add the len to the current pointer for every symbol
+	 * we wish to skip
+	 */
+	for (i = 0; i < (pos & 0xFF); i++)
 		name = name + (*name) + 1;

 	return name - kallsyms_names;
@@ -323,6 +343,7 @@ int sprint_symbol(char *buffer, unsigned long address)

 	return len;
 }
+EXPORT_SYMBOL_GPL(sprint_symbol);

 /* Look up a kernel symbol and print it to the kernel messages. */
 void __print_symbol(const char *fmt, unsigned long address)
@@ -333,10 +354,10 @@ void __print_symbol(const char *fmt, unsigned
long address)

 	printk(fmt, buffer);
 }
+EXPORT_SYMBOL(__print_symbol);

 /* To avoid using get_symbol_offset for every symbol, we carry prefix along. */
-struct kallsym_iter
-{
+struct kallsym_iter {
 	loff_t pos;
 	unsigned long value;
 	unsigned int nameoff; /* If iterating in core kernel symbols */
@@ -385,7 +406,7 @@ static int update_iter(struct kallsym_iter *iter,
loff_t pos)
 		iter->pos = pos;
 		return get_ksymbol_mod(iter);
 	}
-	
+
 	/* If we're not on the desired position, reset to new position. */
 	if (pos != iter->pos)
 		reset_iter(iter, pos);
@@ -420,7 +441,7 @@ static int s_show(struct seq_file *m, void *p)
 {
 	struct kallsym_iter *iter = m->private;

-	/* Some debugging symbols have no name.  Ignore them. */
+	/* Some debugging symbols have no name.  Ignore them. */
 	if (!iter->name[0])
 		return 0;

@@ -432,11 +453,11 @@ static int s_show(struct seq_file *m, void *p)
 		type = iter->exported ? toupper(iter->type) :
 					tolower(iter->type);
 		seq_printf(m, "%0*lx %c %s\t[%s]\n",
-			   (int)(2*sizeof(void*)),
+			   (int)(2 * sizeof(void *)),
 			   iter->value, type, iter->name, iter->module_name);
 	} else
 		seq_printf(m, "%0*lx %c %s\n",
-			   (int)(2*sizeof(void*)),
+			   (int)(2 * sizeof(void *)),
 			   iter->value, iter->type, iter->name);
 	return 0;
 }
@@ -450,9 +471,11 @@ static const struct seq_operations kallsyms_op = {

 static int kallsyms_open(struct inode *inode, struct file *file)
 {
-	/* We keep iterator in m->private, since normal case is to
+	/*
+	 * We keep iterator in m->private, since normal case is to
 	 * s_start from where we left off, so we avoid doing
-	 * using get_symbol_offset for every symbol */
+	 * using get_symbol_offset for every symbol
+	 */
 	struct kallsym_iter *iter;
 	int ret;

@@ -481,7 +504,4 @@ static int __init kallsyms_init(void)
 	proc_create("kallsyms", 0444, NULL, &kallsyms_operations);
 	return 0;
 }
-__initcall(kallsyms_init);
-
-EXPORT_SYMBOL(__print_symbol);
-EXPORT_SYMBOL_GPL(sprint_symbol);
+device_initcall(kallsyms_init);
-- 
1.5.4.3


I have not included the md5sum output, since that has changed because
of comments and isn't much useful for changelog.

Thanks -
Manish
> --
> Stefan Richter
> -===-=--= --=- =--=-
> http://arcgraph.de/sr/
>
