From: Manish Katiyar <mkatiyar@gmail.com>
Date: Fri, 20 Feb 2009 14:49:11 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30902200649h465da751nc37217cdf3a51faa@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 20, 2009 at 2:46 AM, Stefan Richter
<stefanr@s5r6.in-berlin.de> wrote:
> Manish Katiyar wrote:
>> --- a/kernel/kallsyms.c
>> +++ b/kernel/kallsyms.c
> [...]
>> -/* get symbol type information. This is encoded as a single char at the
>> - * begining of the symbol name */
>> +/*
>> + * get symbol type information. This is encoded as a single char at the
>> + * begining of the symbol name
>> + */
>
> Typo: beginning
>
> Besides, several sentences in comments of this file start lower-case but
> end with a full stop, while other sentences start upper-case but don't
> end with a full stop.  The author(s) of the comments obviously didn't
> care for consistency and good readability.  If you like you could fix
> this as well.  :-)

Hi Stefan,

Below is the updated patch


Patch to fix coding style whitespace issues and replace __initcall
with device_initcall. Fixed multi-line comments as per coding style.

Errors as reported by checkpatch.pl :-
Before:
total: 14 errors, 14 warnings, 487 lines checked
After :
total: 0 errors, 8 warnings, 509 lines checked

Compile tested binary verified as :-
Before:
 text    data     bss     dec     hex filename
 2405       4       0    2409     969 kernel/kallsyms.o
After :
 text     data     bss     dec     hex filename
 2405       4       0    2409     969 kernel/kallsyms.o


Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 kernel/kallsyms.c |  134 +++++++++++++++++++++++++++++++----------------------
 1 files changed, 78 insertions(+), 56 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 7b8b0f2..796b04b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -30,12 +30,16 @@
 #define all_var 0
 #endif

-/* These will be re-linked against their real values during the
second link stage */
+/*
+ * These will be re-linked against their real values
+ * during the second link stage.
+ */
 extern const unsigned long kallsyms_addresses[] __attribute__((weak));
 extern const u8 kallsyms_names[] __attribute__((weak));

-/* tell the compiler that the count isn't in the small data section if the arch
- * has one (eg: FRV)
+/*
+ * Tell the compiler that the count isn't in the small data section if the arch
+ * has one (eg: FRV).
  */
 extern const unsigned long kallsyms_num_syms
 __attribute__((weak, section(".rodata")));
@@ -75,31 +79,37 @@ static int is_ksym_addr(unsigned long addr)
 	return is_kernel_text(addr) || is_kernel_inittext(addr);
 }

-/* expand a compressed symbol data into the resulting uncompressed string,
-   given the offset to where the symbol is in the compressed stream */
+/*
+ * Expand a compressed symbol data into the resulting uncompressed string,
+ * given the offset to where the symbol is in the compressed stream.
+ */
 static unsigned int kallsyms_expand_symbol(unsigned int off, char *result)
 {
 	int len, skipped_first = 0;
 	const u8 *tptr, *data;

-	/* get the compressed symbol length from the first symbol byte */
+	/* Get the compressed symbol length from the first symbol byte. */
 	data = &kallsyms_names[off];
 	len = *data;
 	data++;

-	/* update the offset to return the offset for the next symbol on
-	 * the compressed stream */
+	/*
+	 * Update the offset to return the offset for the next symbol on
+	 * the compressed stream.
+	 */
 	off += len + 1;

-	/* for every byte on the compressed symbol data, copy the table
-	   entry for that byte */
-	while(len) {
-		tptr = &kallsyms_token_table[ kallsyms_token_index[*data] ];
+	/*
+	 * For every byte on the compressed symbol data, copy the table
+	 * entry for that byte.
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
@@ -110,36 +120,46 @@ static unsigned int
kallsyms_expand_symbol(unsigned int off, char *result)

 	*result = '\0';

-	/* return to offset to the next symbol */
+	/* Return to offset to the next symbol. */
 	return off;
 }

-/* get symbol type information. This is encoded as a single char at the
- * begining of the symbol name */
+/*
+ * Get symbol type information. This is encoded as a single char at the
+ * beginning of the symbol name.
+ */
 static char kallsyms_get_symbol_type(unsigned int off)
 {
-	/* get just the first code, look it up in the token table, and return the
-	 * first char from this token */
-	return kallsyms_token_table[ kallsyms_token_index[ kallsyms_names[off+1] ] ];
+	/*
+	 * Get just the first code, look it up in the token table,
+	 * and return the first char from this token.
+	 */
+	return kallsyms_token_table[kallsyms_token_index[kallsyms_names[off + 1]]];
 }


-/* find the offset on the compressed stream given and index in the
- * kallsyms array */
+/*
+ * Find the offset on the compressed stream given and index in the
+ * kallsyms array.
+ */
 static unsigned int get_symbol_offset(unsigned long pos)
 {
 	const u8 *name;
 	int i;

-	/* use the closest marker we have. We have markers every 256 positions,
-	 * so that should be close enough */
-	name = &kallsyms_names[ kallsyms_markers[pos>>8] ];
+	/*
+	 * Use the closest marker we have. We have markers every 256 positions,
+	 * so that should be close enough.
+	 */
+	name = &kallsyms_names[kallsyms_markers[pos >> 8]];

-	/* sequentially scan all the symbols up to the point we're searching for.
-	 * Every symbol is stored in a [<len>][<len> bytes of data] format, so we
-	 * just need to add the len to the current pointer for every symbol we
-	 * wish to skip */
-	for(i = 0; i < (pos&0xFF); i++)
+	/*
+	 * Sequentially scan all the symbols up to the point we're searching
+	 * for. Every symbol is stored in a [<len>][<len> bytes of data] format,
+	 * so we just need to add the len to the current pointer for every
+	 * symbol we wish to skip.
+	 */
+	for (i = 0; i < (pos & 0xFF); i++)
 		name = name + (*name) + 1;

 	return name - kallsyms_names;
@@ -171,7 +191,7 @@ static unsigned long get_symbol_pos(unsigned long addr,
 	/* This kernel should never had been booted. */
 	BUG_ON(!kallsyms_addresses);

-	/* do a binary search on the sorted kallsyms_addresses array */
+	/* Do a binary search on the sorted kallsyms_addresses array. */
 	low = 0;
 	high = kallsyms_num_syms;

@@ -184,15 +204,15 @@ static unsigned long get_symbol_pos(unsigned long addr,
 	}

 	/*
-	 * search for the first aliased symbol. Aliased
-	 * symbols are symbols with the same address
+	 * Search for the first aliased symbol. Aliased
+	 * symbols are symbols with the same address.
 	 */
 	while (low && kallsyms_addresses[low-1] = kallsyms_addresses[low])
 		--low;

 	symbol_start = kallsyms_addresses[low];

-	/* Search for next non-aliased symbol */
+	/* Search for next non-aliased symbol. */
 	for (i = low + 1; i < kallsyms_num_syms; i++) {
 		if (kallsyms_addresses[i] > symbol_start) {
 			symbol_end = kallsyms_addresses[i];
@@ -200,7 +220,7 @@ static unsigned long get_symbol_pos(unsigned long addr,
 		}
 	}

-	/* if we found no next symbol, we use the end of the section */
+	/* If we found no next symbol, we use the end of the section. */
 	if (!symbol_end) {
 		if (is_kernel_inittext(addr))
 			symbol_end = (unsigned long)_einittext;
@@ -233,10 +253,10 @@ int kallsyms_lookup_size_offset(unsigned long
addr, unsigned long *symbolsize,

 /*
  * Lookup an address
- * - modname is set to NULL if it's in the kernel
- * - we guarantee that the returned name is valid until we reschedule even if
- *   it resides in a module
- * - we also guarantee that modname will be valid until rescheduled
+ * - modname is set to NULL if it's in the kernel.
+ * - We guarantee that the returned name is valid until we reschedule even if.
+ *   It resides in a module.
+ * - We also guarantee that modname will be valid until rescheduled.
  */
 const char *kallsyms_lookup(unsigned long addr,
 			    unsigned long *symbolsize,
@@ -257,7 +277,7 @@ const char *kallsyms_lookup(unsigned long addr,
 		return namebuf;
 	}

-	/* see if it's in a module */
+	/* See if it's in a module. */
 	return module_address_lookup(addr, symbolsize, offset, modname,
 				     namebuf);
 }
@@ -275,7 +295,7 @@ int lookup_symbol_name(unsigned long addr, char *symname)
 		kallsyms_expand_symbol(get_symbol_offset(pos), symname);
 		return 0;
 	}
-	/* see if it's in a module */
+	/* See if it's in a module. */
 	return lookup_module_symbol_name(addr, symname);
 }

@@ -294,7 +314,7 @@ int lookup_symbol_attrs(unsigned long addr,
unsigned long *size,
 		modname[0] = '\0';
 		return 0;
 	}
-	/* see if it's in a module */
+	/* See if it's in a module. */
 	return lookup_module_symbol_attrs(addr, size, offset, modname, name);
 }

@@ -323,6 +343,7 @@ int sprint_symbol(char *buffer, unsigned long address)

 	return len;
 }
+EXPORT_SYMBOL_GPL(sprint_symbol);

 /* Look up a kernel symbol and print it to the kernel messages. */
 void __print_symbol(const char *fmt, unsigned long address)
@@ -333,13 +354,13 @@ void __print_symbol(const char *fmt, unsigned
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
-	unsigned int nameoff; /* If iterating in core kernel symbols */
+	unsigned int nameoff; /* If iterating in core kernel symbols. */
 	char type;
 	char name[KSYM_NAME_LEN];
 	char module_name[MODULE_NAME_LEN];
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
@@ -420,23 +441,25 @@ static int s_show(struct seq_file *m, void *p)
 {
 	struct kallsym_iter *iter = m->private;

-	/* Some debugging symbols have no name.  Ignore them. */
+	/* Some debugging symbols have no name.  Ignore them. */
 	if (!iter->name[0])
 		return 0;

 	if (iter->module_name[0]) {
 		char type;

-		/* Label it "global" if it is exported,
-		 * "local" if not exported. */
+		/*
+		 * Label it "global" if it is exported,
+		 * "local" if not exported.
+		 */
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
@@ -450,9 +473,11 @@ static const struct seq_operations kallsyms_op = {

 static int kallsyms_open(struct inode *inode, struct file *file)
 {
-	/* We keep iterator in m->private, since normal case is to
+	/*
+	 * We keep iterator in m->private, since normal case is to
 	 * s_start from where we left off, so we avoid doing
-	 * using get_symbol_offset for every symbol */
+	 * using get_symbol_offset for every symbol.
+	 */
 	struct kallsym_iter *iter;
 	int ret;

@@ -481,7 +506,4 @@ static int __init kallsyms_init(void)
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




Thanks -
Manish


> --
> Stefan Richter
> -===-=--= --=- =--=
> http://arcgraph.de/sr/
>
