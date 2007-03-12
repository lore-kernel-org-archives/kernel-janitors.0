From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Mon, 12 Mar 2007 01:18:32 +0000
Subject: Re: [KJ] pondering a curiosity regarding container_of() macro
Message-Id: <39e6f6c70703111818r1cf1720bieb01bb60cb9bcc0c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703111855590.6582@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703111855590.6582@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/11/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   earlier today, i ran my style script to look for, among other
> things, places in the kernel code that could be transformed into calls
> to the "container_of" macro, and i ran across this snippet in the
> source file net/ipv4/netfilter/nf_nat_core.c:
>
> ...
> static int
> find_appropriate_src(const struct nf_conntrack_tuple *tuple,
>                      struct nf_conntrack_tuple *result,
>                      const struct nf_nat_range *range)
> {
>         unsigned int h = hash_by_src(tuple);
>         struct nf_conn_nat *nat;
>         struct nf_conn *ct;
>
>         read_lock_bh(&nf_nat_lock);
>         list_for_each_entry(nat, &bysource[h], info.bysource) {
>                 ct = (struct nf_conn *)((char *)nat - offsetof(struct nf_conn, data));
> ...
>
>   ok, thought i, that last statement is an obvious candidate for
> replacement with:
>
>                 ct = container_of(nat, struct nf_conn, data);

Look at how the sock hierarchy is done, its a, IMHO cleaner way of
expressing what the netfilter guys want to express with the above
code: a class hierarchy where the base class is struct nf_conn.

struct nf_conn_nat is just a class derived from struct nf_conn, i.e.
every allocation of a struct nf_conn_nat in fact is an allocation of
(sizeof(struct nf_conn) + sizeof(struct nf_conn_nat)) bytes (I haven't
checked, but seems obvious that this is the case :-)), and it is
possible to pass around a struct nf_conn_nat pointer and get the base
class by subtracting the offset of the last zero sized member
(data[0]) of struct nf_conn from it, which is just too complicated,
why not use:

ct = (struct nf_conn *)((char *)nat - sizeof(struct nf_conn));

and just nuke the data[0] from struct nf_conn?

data[0] can be used to get the derived class from a pointer to the
base class, like:

int foo(struct nf_conn *base)
{
       struct nf_conn_nat *derived = (struct nf_conn_nat *)base->data;
}

but it could be expressed as well as:

struct nf_conn_nat *derived = (struct nf_conn_nat *)(base + 1);

In the struct sock hierarchy
(http://vger.kernel.org/~acme/sock_hierarchy.ps), I did it by just
adding the base class as the first member of the derived classes, that
would map in this case to:

struct nf_conn_nat {
          struct nf_conn nfc;
          <put here the nf_conn_nat specific fields>;
}

And use just pointers to the base class in all the methods, so that we
could just
do a simple cast to the desired type, as all pointers would be
pointers to the base class _and_ the derived class.

If using the derived class as a pointer is desired, no problem, to
access the base type its just a matter of accessing struct
derived->base.field.

To see an example of the struct sock hierarchy obtained from pahole:

http://oops.ghostprotocols.net:81/acme/dwarves/pahole--expand_types-struct-tcp6_sock.txt

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
