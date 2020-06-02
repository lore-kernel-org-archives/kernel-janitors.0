From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 02 Jun 2020 11:23:57 +0000
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error message
Message-Id: <87a71liucy.fsf@mpe.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
 <87imgai394.fsf@mpe.ellerman.id.au>
 <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
In-Reply-To: <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Liao Pingfang <liao.pingfang@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, Joe Perches <joe@perches.com>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>, Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

Markus Elfring <Markus.Elfring@web.de> writes:
>>>> Please just remove the message instead, it's a tiny allocation that's
>>>> unlikely to ever fail, and the caller will print an error anyway.
>>>
>>> How do you think about to take another look at a previous update suggestion
>>> like the following?
>>>
>>> powerpc/nvram: Delete three error messages for a failed memory allocation
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>>> https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>>> https://lore.kernel.org/patchwork/patch/752720/
>>> https://lkml.org/lkml/2017/1/19/537
>>
>> That deleted the messages from nvram_scan_partitions(), but neither of
>> the callers of nvram_scan_paritions() check its return value or print
>> anything if it fails. So removing those messages would make those
>> failures silent which is not what we want.
>
> * How do you think about information like the following?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f359287765c04711ff54fbd11645271d8e5ff763#n883
> “…
> These generic allocation functions all emit a stack dump on failure when used
> without __GFP_NOWARN so there is no use in emitting an additional failure
> message when NULL is returned.
> …”

Are you sure that's actually true?

A quick look around in slub.c leads me to:

slab_out_of_memory(struct kmem_cache *s, gfp_t gfpflags, int nid)
{
#ifdef CONFIG_SLUB_DEBUG
	static DEFINE_RATELIMIT_STATE(slub_oom_rs, DEFAULT_RATELIMIT_INTERVAL,
				      DEFAULT_RATELIMIT_BURST);
	int node;
	struct kmem_cache_node *n;

	if ((gfpflags & __GFP_NOWARN) || !__ratelimit(&slub_oom_rs))
		return;

	pr_warn("SLUB: Unable to allocate memory on node %d, gfp=%#x(%pGg)\n",
		nid, gfpflags, &gfpflags);
	pr_warn("  cache: %s, object size: %u, buffer size: %u, default order: %u, min order: %u\n",
		s->name, s->object_size, s->size, oo_order(s->oo),
		oo_order(s->min));

	if (oo_order(s->min) > get_order(s->object_size))
		pr_warn("  %s debugging increased min order, use slub_debug=O to disable.\n",
			s->name);

	for_each_kmem_cache_node(s, node, n) {
		unsigned long nr_slabs;
		unsigned long nr_objs;
		unsigned long nr_free;

		nr_free  = count_partial(n, count_free);
		nr_slabs = node_nr_slabs(n);
		nr_objs  = node_nr_objs(n);

		pr_warn("  node %d: slabs: %ld, objs: %ld, free: %ld\n",
			node, nr_slabs, nr_objs, nr_free);
	}
#endif
}

Which looks a lot like it won't print anything when CONFIG_SLUB_DEBUG=n.

But maybe I'm looking in the wrong place?

cheers
