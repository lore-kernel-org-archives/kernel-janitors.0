From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 11 Mar 2007 23:09:28 +0000
Subject: [KJ] pondering a curiosity regarding container_of() macro
Message-Id: <Pine.LNX.4.64.0703111855590.6582@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  earlier today, i ran my style script to look for, among other
things, places in the kernel code that could be transformed into calls
to the "container_of" macro, and i ran across this snippet in the
source file net/ipv4/netfilter/nf_nat_core.c:

...
static int
find_appropriate_src(const struct nf_conntrack_tuple *tuple,
                     struct nf_conntrack_tuple *result,
                     const struct nf_nat_range *range)
{
        unsigned int h = hash_by_src(tuple);
        struct nf_conn_nat *nat;
        struct nf_conn *ct;

        read_lock_bh(&nf_nat_lock);
        list_for_each_entry(nat, &bysource[h], info.bysource) {
                ct = (struct nf_conn *)((char *)nat - offsetof(struct nf_conn, data));
...

  ok, thought i, that last statement is an obvious candidate for
replacement with:

		ct = container_of(nat, struct nf_conn, data);

so i did and recompiled to see:

  CC [M]  net/ipv4/netfilter/nf_nat_core.o
net/ipv4/netfilter/nf_nat_core.c: In function ...:
net/ipv4/netfilter/nf_nat_core.c:172: warning: initialization from incompatible pointer type

huh?  i didn't get that warning with the original C, so i looked more
closely and noticed that the pointer to the member "nat" is *not* of
the same type as the structure type being passed to offsetof (struct
nf_conn_nat versus struct nf_conn).  and that's definitely going to
cause a problem for container_of:

#define container_of(ptr, type, member) ({                      \
        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \  <--
        (type *)( (char *)__mptr - offsetof(type,member) );})

note how that macro assumes that the type of "ptr" is "(type *)",
which in this case it clearly isn't, hence the warning.

  clearly, container_of() isn't designed to handle that situation
gracefully, but why should it?  it seems that that original code is
really abusing the concept of using pointers and offsets to emulate
container_of(), when it's explicitly working with incompatible pointer
types.

  i don't imagine it's worth trying to do anything about that but ...
ewwwwwwwwww.  it just kind of leaves a bad taste in my mouth.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
