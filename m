From: Bryce Harrington <bryce@osdl.org>
Date: Mon, 25 Sep 2006 06:50:21 +0000
Subject: Re: [KJ] [PATCH] Fix for some typos in Documentation/makefiles.txt
Message-Id: <20060925065021.GE5466@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060920194337.GD17157@osdl.org>
In-Reply-To: <20060920194337.GD17157@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 24, 2006 at 10:43:06AM +0200, Sam Ravnborg wrote:
> On Wed, Sep 20, 2006 at 12:43:37PM -0700, Bryce Harrington wrote:
> > Hi Kai,
> > 
> > I noticed a few typos while reading makefiles.txt to learn about the
> > kbuild system.  Attached is a patch against 2.6.18 to fix them.
> Fixed up, removed trailing whitespace in all of the file and applied.
> 
> 	Sam

Excellent, thanks.

> > Do you know of a tool or technique which can be used from the
> > commandline to alter an arbitrary symbol's value in a given .config
> > file, and cascade the change to any dependent symbols, using a given
> > kernel Kconfig?  From what I have gathered, there is no such thing
> > that does exactly this; do you know if this is true?
>
> Unfortunately correct.  It has been requested several times but noone
> has come up with neither a good interface to kconfig to do it, nor a
> good implmentation of such thing.
>
> For someone that understands the kconfig datastructures it should be
> doable but I at least have failed to get a good grip on it so far.  And
> Roman Zippel - the kconfig maintainer - has been busy with other stuff
> lately and haven't come up with something useful either.

Given that the symbol portion of the kconfig data structures seem to be
the key piece to understand for this, I wrote some documentation for the
portion I was able to understand.  Hopefully this could serve as a
starting point for something better...

Bryce

Signed-off-by:  Bryce Harrington <bryce@osdl.org>
Applies-to:     linux-2.6.18

--- linux-2.6.18-vanilla/scripts/kconfig/symbol.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/scripts/kconfig/symbol.c	2006-09-24 23:32:58.000000000 -0700
@@ -42,6 +42,12 @@
 	prop->expr = expr_alloc_symbol(sym_lookup(def, 1));
 }
 
+/**
+ * sym_init - Creates several of the root symbols in symbol_hash,
+ * including symbols for ARCH, KERNEL_VERSION, and UNAME_RELEASE,
+ * defaulting the values to the respective environment variables,
+ * if set.
+ */
 void sym_init(void)
 {
 	struct symbol *sym;
@@ -75,6 +81,9 @@
 	sym_add_default(sym, uts.release);
 }
 
+/**
+ * sym_get_type - returns the type for @sym.
+ */
 enum symbol_type sym_get_type(struct symbol *sym)
 {
 	enum symbol_type type = sym->type;
@@ -88,6 +97,10 @@
 	return type;
 }
 
+/**
+ * sym_type_name - converts @type from a symbol_type to the appropriate
+ * string version.  Returns "???" if it doesn't recognize @type.
+ */
 const char *sym_type_name(enum symbol_type type)
 {
 	switch (type) {
@@ -109,6 +122,9 @@
 	return "???";
 }
 
+/**
+ * Returns the first choice property in @sym
+ */
 struct property *sym_get_choice_prop(struct symbol *sym)
 {
 	struct property *prop;
@@ -118,6 +134,10 @@
 	return NULL;
 }
 
+/**
+ * sym_get_default_prop - Returns the first default property in
+ * @sym that has its visible tri-state set to something other than no.
+ */
 struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
@@ -130,6 +150,10 @@
 	return NULL;
 }
 
+/**
+ * sym_get_range_prop - Returns the first range property in @sym
+ * that has its visible tri-state set to something other than no.
+ */
 struct property *sym_get_range_prop(struct symbol *sym)
 {
 	struct property *prop;
@@ -260,6 +284,11 @@
 	return NULL;
 }
 
+/**
+ * sym_calc_value - recalculates the value for @sym based on its type,
+ * including the symbol's visibility.  Sets values to defaults if 
+ * called recursively.
+ */
 void sym_calc_value(struct symbol *sym)
 {
 	struct symbol_value newval, oldval;
@@ -372,6 +401,10 @@
 	}
 }
 
+/**
+ * sym_clear_all_valid - Clears the SYMBOL_VALID flag for all symbols.
+ * Also causes sym_calc_value() to run on module symbols, if appropriate.
+ */
 void sym_clear_all_valid(void)
 {
 	struct symbol *sym;
@@ -384,6 +417,10 @@
 		sym_calc_value(modules_sym);
 }
 
+/**
+ * sym_set_changed - Marks a given symbol @sym as changed, and
+ * marks all of its sub-properties with the MENU_CHANGED flag.
+ */
 void sym_set_changed(struct symbol *sym)
 {
 	struct property *prop;
@@ -395,6 +432,10 @@
 	}
 }
 
+/**
+ * sym_set_all_changed - Flags all symbols with SYMBOL_CHANGED,
+ * and marks all properties of all symbols as MENU_CHANGED.
+ */
 void sym_set_all_changed(void)
 {
 	struct symbol *sym;
@@ -404,6 +445,11 @@
 		sym_set_changed(sym);
 }
 
+/**
+ * sym_tristate_within_range - checks if @val is an acceptable value
+ * for symbol, returning false if it is not.  @sym must be visible
+ * and either type S_TRISTATE or S_BOOLEAN.
+ */
 bool sym_tristate_within_range(struct symbol *sym, tristate val)
 {
 	int type = sym_get_type(sym);
@@ -423,6 +469,13 @@
 	return val >= sym->rev_dep.tri && val <= sym->visible;
 }
 
+/**
+ * sym_set_tristate_value - Sets @sym to the tristate value @val, returning
+ * false if it could not be set.  @val must be a valid setting for @sym.
+ *
+ * If @sym has a choice type of value, then other symbols will get flagged
+ * SYMBOL_NEW, as appropriate.
+ */
 bool sym_set_tristate_value(struct symbol *sym, tristate val)
 {
 	tristate oldval = sym_get_tristate_value(sym);
@@ -567,6 +620,14 @@
 	}
 }
 
+/**
+ * sym_set_string_value - Sets @sym's value to @newval, returning false
+ * if the value could not be set.  If @sym is of type boolean, then only
+ * characters in "yYnN" are accepted; if @sym is of type tristate, then
+ * characters in "yYnNmM" are accepted.
+ *
+ * This also causes all SYMBOL_VALID flags to be cleared.
+ */
 bool sym_set_string_value(struct symbol *sym, const char *newval)
 {
 	const char *oldval;
@@ -616,6 +677,10 @@
 	return true;
 }
 
+/**
+ * sym_get_string_value - Returns a string version of @sym's current
+ * value.  For boolean or tristate symbols, this is 'n', 'm', or 'y'.
+ */
 const char *sym_get_string_value(struct symbol *sym)
 {
 	tristate val;
@@ -644,6 +709,11 @@
 	return sym->visible > sym->rev_dep.tri;
 }
 
+/**
+ * sym_lookup - gets the symbol object matching the string @name and
+ * indicator @isconst.  Creates a new symbol if one doesn't already 
+ * exist in symbol_hash, and adds it to the hash.
+ */
 struct symbol *sym_lookup(const char *name, int isconst)
 {
 	struct symbol *symbol;
@@ -689,6 +759,11 @@
 	return symbol;
 }
 
+/**
+ * sym_find - returns a symbol for @name.  'y', 'm', and 'n'
+ * return symbol_yes, symbol_mod, and symbol_no, respectively,
+ * while other @name's are looked up in symbol_hash.
+ */
 struct symbol *sym_find(const char *name)
 {
 	struct symbol *symbol = NULL;
@@ -828,6 +903,11 @@
 	return sym2;
 }
 
+/**
+ * prop_alloc - Allocates and returns a property object for the 
+ * symbol @sym, of type @type.  Also appends the new property to
+ * the symbol's property list.
+ */
 struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 {
 	struct property *prop;
@@ -858,6 +938,10 @@
 	return NULL;
 }
 
+/**
+ * prop_get_type_name - Returns a string version of the property type
+ * @type, such as 'prompt', 'menu', 'select', etc.
+ */
 const char *prop_get_type_name(enum prop_type type)
 {
 	switch (type) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
