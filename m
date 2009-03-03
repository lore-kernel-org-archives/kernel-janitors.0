From: Manish Katiyar <mkatiyar@gmail.com>
Date: Tue, 03 Mar 2009 14:45:49 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30903030633gcebcb14t267958359cfc819f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Feb 20, 2009 at 8:19 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> On Fri, Feb 20, 2009 at 2:46 AM, Stefan Richter
> <stefanr@s5r6.in-berlin.de> wrote:
>> Manish Katiyar wrote:
>>> --- a/kernel/kallsyms.c
>>> +++ b/kernel/kallsyms.c
>> [...]
>>> -/* get symbol type information. This is encoded as a single char at the
>>> - * begining of the symbol name */
>>> +/*
>>> + * get symbol type information. This is encoded as a single char at the
>>> + * begining of the symbol name
>>> + */
>>
>> Typo: beginning
>>
>> Besides, several sentences in comments of this file start lower-case but
>> end with a full stop, while other sentences start upper-case but don't
>> end with a full stop. =A0The author(s) of the comments obviously didn't
>> care for consistency and good readability. =A0If you like you could fix
>> this as well. =A0:-)
>
> Hi Stefan,
>
> Below is the updated patch

Hi Stefan,

Has this been accepted, or is it still not worth it ?

Thanks -
Manish


>
>
> Patch to fix coding style whitespace issues and replace __initcall
> with device_initcall. Fixed multi-line comments as per coding style.
>
> Errors as reported by checkpatch.pl :-
> Before:
> total: 14 errors, 14 warnings, 487 lines checked
> After :
> total: 0 errors, 8 warnings, 509 lines checked
>
> Compile tested binary verified as :-
> Before:
> =A0text =A0 =A0data =A0 =A0 bss =A0 =A0 dec =A0 =A0 hex filename
> =A02405 =A0 =A0 =A0 4 =A0 =A0 =A0 0 =A0 =A02409 =A0 =A0 969 kernel/kallsy=
ms.o
> After :
> =A0text =A0 =A0 data =A0 =A0 bss =A0 =A0 dec =A0 =A0 hex filename
> =A02405 =A0 =A0 =A0 4 =A0 =A0 =A0 0 =A0 =A02409 =A0 =A0 969 kernel/kallsy=
ms.o
>
>
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
> ---
> =A0kernel/kallsyms.c | =A0134 +++++++++++++++++++++++++++++++------------=
----------
> =A01 files changed, 78 insertions(+), 56 deletions(-)
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 7b8b0f2..796b04b 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -30,12 +30,16 @@
> =A0#define all_var 0
> =A0#endif
>
> -/* These will be re-linked against their real values during the
> second link stage */
> +/*
> + * These will be re-linked against their real values
> + * during the second link stage.
> + */
> =A0extern const unsigned long kallsyms_addresses[] __attribute__((weak));
> =A0extern const u8 kallsyms_names[] __attribute__((weak));
>
> -/* tell the compiler that the count isn't in the small data section if t=
he arch
> - * has one (eg: FRV)
> +/*
> + * Tell the compiler that the count isn't in the small data section if t=
he arch
> + * has one (eg: FRV).
> =A0*/
> =A0extern const unsigned long kallsyms_num_syms
> =A0__attribute__((weak, section(".rodata")));
> @@ -75,31 +79,37 @@ static int is_ksym_addr(unsigned long addr)
> =A0 =A0 =A0 =A0return is_kernel_text(addr) || is_kernel_inittext(addr);
> =A0}
>
> -/* expand a compressed symbol data into the resulting uncompressed strin=
g,
> - =A0 given the offset to where the symbol is in the compressed stream */
> +/*
> + * Expand a compressed symbol data into the resulting uncompressed strin=
g,
> + * given the offset to where the symbol is in the compressed stream.
> + */
> =A0static unsigned int kallsyms_expand_symbol(unsigned int off, char *res=
ult)
> =A0{
> =A0 =A0 =A0 =A0int len, skipped_first =3D 0;
> =A0 =A0 =A0 =A0const u8 *tptr, *data;
>
> - =A0 =A0 =A0 /* get the compressed symbol length from the first symbol b=
yte */
> + =A0 =A0 =A0 /* Get the compressed symbol length from the first symbol b=
yte. */
> =A0 =A0 =A0 =A0data =3D &kallsyms_names[off];
> =A0 =A0 =A0 =A0len =3D *data;
> =A0 =A0 =A0 =A0data++;
>
> - =A0 =A0 =A0 /* update the offset to return the offset for the next symb=
ol on
> - =A0 =A0 =A0 =A0* the compressed stream */
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Update the offset to return the offset for the next sy=
mbol on
> + =A0 =A0 =A0 =A0* the compressed stream.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0off +=3D len + 1;
>
> - =A0 =A0 =A0 /* for every byte on the compressed symbol data, copy the t=
able
> - =A0 =A0 =A0 =A0 =A0entry for that byte */
> - =A0 =A0 =A0 while(len) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tptr =3D &kallsyms_token_table[ kallsyms_to=
ken_index[*data] ];
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* For every byte on the compressed symbol data, copy the=
 table
> + =A0 =A0 =A0 =A0* entry for that byte.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 while (len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tptr =3D &kallsyms_token_table[kallsyms_tok=
en_index[*data]];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len--;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while (*tptr) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if(skipped_first) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (skipped_first) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*result =
=3D *tptr;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0result++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else
> @@ -110,36 +120,46 @@ static unsigned int
> kallsyms_expand_symbol(unsigned int off, char *result)
>
> =A0 =A0 =A0 =A0*result =3D '\0';
>
> - =A0 =A0 =A0 /* return to offset to the next symbol */
> + =A0 =A0 =A0 /* Return to offset to the next symbol. */
> =A0 =A0 =A0 =A0return off;
> =A0}
>
> -/* get symbol type information. This is encoded as a single char at the
> - * begining of the symbol name */
> +/*
> + * Get symbol type information. This is encoded as a single char at the
> + * beginning of the symbol name.
> + */
> =A0static char kallsyms_get_symbol_type(unsigned int off)
> =A0{
> - =A0 =A0 =A0 /* get just the first code, look it up in the token table, =
and return the
> - =A0 =A0 =A0 =A0* first char from this token */
> - =A0 =A0 =A0 return kallsyms_token_table[ kallsyms_token_index[ kallsyms=
_names[off+1] ] ];
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Get just the first code, look it up in the token table,
> + =A0 =A0 =A0 =A0* and return the first char from this token.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 return kallsyms_token_table[kallsyms_token_index[kallsyms_n=
ames[off + 1]]];
> =A0}
>
>
> -/* find the offset on the compressed stream given and index in the
> - * kallsyms array */
> +/*
> + * Find the offset on the compressed stream given and index in the
> + * kallsyms array.
> + */
> =A0static unsigned int get_symbol_offset(unsigned long pos)
> =A0{
> =A0 =A0 =A0 =A0const u8 *name;
> =A0 =A0 =A0 =A0int i;
>
> - =A0 =A0 =A0 /* use the closest marker we have. We have markers every 25=
6 positions,
> - =A0 =A0 =A0 =A0* so that should be close enough */
> - =A0 =A0 =A0 name =3D &kallsyms_names[ kallsyms_markers[pos>>8] ];
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Use the closest marker we have. We have markers every =
256 positions,
> + =A0 =A0 =A0 =A0* so that should be close enough.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 name =3D &kallsyms_names[kallsyms_markers[pos >> 8]];
>
> - =A0 =A0 =A0 /* sequentially scan all the symbols up to the point we're =
searching for.
> - =A0 =A0 =A0 =A0* Every symbol is stored in a [<len>][<len> bytes of dat=
a] format, so we
> - =A0 =A0 =A0 =A0* just need to add the len to the current pointer for ev=
ery symbol we
> - =A0 =A0 =A0 =A0* wish to skip */
> - =A0 =A0 =A0 for(i =3D 0; i < (pos&0xFF); i++)
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Sequentially scan all the symbols up to the point we'r=
e searching
> + =A0 =A0 =A0 =A0* for. Every symbol is stored in a [<len>][<len> bytes o=
f data] format,
> + =A0 =A0 =A0 =A0* so we just need to add the len to the current pointer =
for every
> + =A0 =A0 =A0 =A0* symbol we wish to skip.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (i =3D 0; i < (pos & 0xFF); i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name =3D name + (*name) + 1;
>
> =A0 =A0 =A0 =A0return name - kallsyms_names;
> @@ -171,7 +191,7 @@ static unsigned long get_symbol_pos(unsigned long add=
r,
> =A0 =A0 =A0 =A0/* This kernel should never had been booted. */
> =A0 =A0 =A0 =A0BUG_ON(!kallsyms_addresses);
>
> - =A0 =A0 =A0 /* do a binary search on the sorted kallsyms_addresses arra=
y */
> + =A0 =A0 =A0 /* Do a binary search on the sorted kallsyms_addresses arra=
y. */
> =A0 =A0 =A0 =A0low =3D 0;
> =A0 =A0 =A0 =A0high =3D kallsyms_num_syms;
>
> @@ -184,15 +204,15 @@ static unsigned long get_symbol_pos(unsigned long a=
ddr,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/*
> - =A0 =A0 =A0 =A0* search for the first aliased symbol. Aliased
> - =A0 =A0 =A0 =A0* symbols are symbols with the same address
> + =A0 =A0 =A0 =A0* Search for the first aliased symbol. Aliased
> + =A0 =A0 =A0 =A0* symbols are symbols with the same address.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0while (low && kallsyms_addresses[low-1] =3D kallsyms_addre=
sses[low])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--low;
>
> =A0 =A0 =A0 =A0symbol_start =3D kallsyms_addresses[low];
>
> - =A0 =A0 =A0 /* Search for next non-aliased symbol */
> + =A0 =A0 =A0 /* Search for next non-aliased symbol. */
> =A0 =A0 =A0 =A0for (i =3D low + 1; i < kallsyms_num_syms; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (kallsyms_addresses[i] > symbol_start) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0symbol_end =3D kallsyms_ad=
dresses[i];
> @@ -200,7 +220,7 @@ static unsigned long get_symbol_pos(unsigned long add=
r,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 /* if we found no next symbol, we use the end of the sectio=
n */
> + =A0 =A0 =A0 /* If we found no next symbol, we use the end of the sectio=
n. */
> =A0 =A0 =A0 =A0if (!symbol_end) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (is_kernel_inittext(addr))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0symbol_end =3D (unsigned l=
ong)_einittext;
> @@ -233,10 +253,10 @@ int kallsyms_lookup_size_offset(unsigned long
> addr, unsigned long *symbolsize,
>
> =A0/*
> =A0* Lookup an address
> - * - modname is set to NULL if it's in the kernel
> - * - we guarantee that the returned name is valid until we reschedule ev=
en if
> - * =A0 it resides in a module
> - * - we also guarantee that modname will be valid until rescheduled
> + * - modname is set to NULL if it's in the kernel.
> + * - We guarantee that the returned name is valid until we reschedule ev=
en if.
> + * =A0 It resides in a module.
> + * - We also guarantee that modname will be valid until rescheduled.
> =A0*/
> =A0const char *kallsyms_lookup(unsigned long addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long *sym=
bolsize,
> @@ -257,7 +277,7 @@ const char *kallsyms_lookup(unsigned long addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return namebuf;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 /* see if it's in a module */
> + =A0 =A0 =A0 /* See if it's in a module. */
> =A0 =A0 =A0 =A0return module_address_lookup(addr, symbolsize, offset, mod=
name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 n=
amebuf);
> =A0}
> @@ -275,7 +295,7 @@ int lookup_symbol_name(unsigned long addr, char *symn=
ame)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kallsyms_expand_symbol(get_symbol_offset(p=
os), symname);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 /* see if it's in a module */
> + =A0 =A0 =A0 /* See if it's in a module. */
> =A0 =A0 =A0 =A0return lookup_module_symbol_name(addr, symname);
> =A0}
>
> @@ -294,7 +314,7 @@ int lookup_symbol_attrs(unsigned long addr,
> unsigned long *size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0modname[0] =3D '\0';
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 /* see if it's in a module */
> + =A0 =A0 =A0 /* See if it's in a module. */
> =A0 =A0 =A0 =A0return lookup_module_symbol_attrs(addr, size, offset, modn=
ame, name);
> =A0}
>
> @@ -323,6 +343,7 @@ int sprint_symbol(char *buffer, unsigned long address)
>
> =A0 =A0 =A0 =A0return len;
> =A0}
> +EXPORT_SYMBOL_GPL(sprint_symbol);
>
> =A0/* Look up a kernel symbol and print it to the kernel messages. */
> =A0void __print_symbol(const char *fmt, unsigned long address)
> @@ -333,13 +354,13 @@ void __print_symbol(const char *fmt, unsigned
> long address)
>
> =A0 =A0 =A0 =A0printk(fmt, buffer);
> =A0}
> +EXPORT_SYMBOL(__print_symbol);
>
> =A0/* To avoid using get_symbol_offset for every symbol, we carry prefix =
along. */
> -struct kallsym_iter
> -{
> +struct kallsym_iter {
> =A0 =A0 =A0 =A0loff_t pos;
> =A0 =A0 =A0 =A0unsigned long value;
> - =A0 =A0 =A0 unsigned int nameoff; /* If iterating in core kernel symbol=
s */
> + =A0 =A0 =A0 unsigned int nameoff; /* If iterating in core kernel symbol=
s. */
> =A0 =A0 =A0 =A0char type;
> =A0 =A0 =A0 =A0char name[KSYM_NAME_LEN];
> =A0 =A0 =A0 =A0char module_name[MODULE_NAME_LEN];
> @@ -385,7 +406,7 @@ static int update_iter(struct kallsym_iter *iter,
> loff_t pos)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iter->pos =3D pos;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return get_ksymbol_mod(iter);
> =A0 =A0 =A0 =A0}
> -
> +
> =A0 =A0 =A0 =A0/* If we're not on the desired position, reset to new posi=
tion. */
> =A0 =A0 =A0 =A0if (pos !=3D iter->pos)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reset_iter(iter, pos);
> @@ -420,23 +441,25 @@ static int s_show(struct seq_file *m, void *p)
> =A0{
> =A0 =A0 =A0 =A0struct kallsym_iter *iter =3D m->private;
>
> - =A0 =A0 =A0 /* Some debugging symbols have no name. =A0Ignore them. */
> + =A0 =A0 =A0 /* Some debugging symbols have no name. =A0Ignore them. */
> =A0 =A0 =A0 =A0if (!iter->name[0])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> =A0 =A0 =A0 =A0if (iter->module_name[0]) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char type;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Label it "global" if it is exported,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* "local" if not exported. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Label it "global" if it is exported,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* "local" if not exported.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type =3D iter->exported ? toupper(iter->ty=
pe) :
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0tolower(iter->type);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seq_printf(m, "%0*lx %c %s\t[%s]\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int)(2*sizeof(void*=
)),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int)(2 * sizeof(voi=
d *)),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iter->value, type, it=
er->name, iter->module_name);
> =A0 =A0 =A0 =A0} else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seq_printf(m, "%0*lx %c %s\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int)(2*sizeof(void*=
)),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int)(2 * sizeof(voi=
d *)),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iter->value, iter->ty=
pe, iter->name);
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -450,9 +473,11 @@ static const struct seq_operations kallsyms_op =3D {
>
> =A0static int kallsyms_open(struct inode *inode, struct file *file)
> =A0{
> - =A0 =A0 =A0 /* We keep iterator in m->private, since normal case is to
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* We keep iterator in m->private, since normal case is to
> =A0 =A0 =A0 =A0 * s_start from where we left off, so we avoid doing
> - =A0 =A0 =A0 =A0* using get_symbol_offset for every symbol */
> + =A0 =A0 =A0 =A0* using get_symbol_offset for every symbol.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0struct kallsym_iter *iter;
> =A0 =A0 =A0 =A0int ret;
>
> @@ -481,7 +506,4 @@ static int __init kallsyms_init(void)
> =A0 =A0 =A0 =A0proc_create("kallsyms", 0444, NULL, &kallsyms_operations);
> =A0 =A0 =A0 =A0return 0;
> =A0}
> -__initcall(kallsyms_init);
> -
> -EXPORT_SYMBOL(__print_symbol);
> -EXPORT_SYMBOL_GPL(sprint_symbol);
> +device_initcall(kallsyms_init);
> --
> 1.5.4.3
>
>
>
>
> Thanks -
> Manish
>
>
>> --
>> Stefan Richter
>> -=3D=3D=3D-=3D--=3D --=3D- =3D--=3D
>> http://arcgraph.de/sr/
>>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
