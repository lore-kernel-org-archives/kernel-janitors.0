From: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 03 Jun 2020 11:37:18 +0000
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error message
Message-Id: <87tuzsgz2p.fsf@mpe.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
 <87imgai394.fsf@mpe.ellerman.id.au>
 <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
 <87a71liucy.fsf@mpe.ellerman.id.au> <20200602114158.GB30374@kadam>
In-Reply-To: <20200602114158.GB30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>, Liao Pingfang <liao.pingfang@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>, Colin Cross <ccross@android.com>, Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>

Dan Carpenter <dan.carpenter@oracle.com> writes:
> On Tue, Jun 02, 2020 at 09:23:57PM +1000, Michael Ellerman wrote:
>> Markus Elfring <Markus.Elfring@web.de> writes:
>> >>>> Please just remove the message instead, it's a tiny allocation that's
>> >>>> unlikely to ever fail, and the caller will print an error anyway.
>> >>>
>> >>> How do you think about to take another look at a previous update suggestion
>> >>> like the following?
>> >>>
>> >>> powerpc/nvram: Delete three error messages for a failed memory allocation
>> >>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>> >>> https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
>> >>> https://lore.kernel.org/patchwork/patch/752720/
>> >>> https://lkml.org/lkml/2017/1/19/537
>> >>
>> >> That deleted the messages from nvram_scan_partitions(), but neither of
>> >> the callers of nvram_scan_paritions() check its return value or print
>> >> anything if it fails. So removing those messages would make those
>> >> failures silent which is not what we want.
>> >
>> > * How do you think about information like the following?
>> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f359287765c04711ff54fbd11645271d8e5ff763#n883
>> > “…
>> > These generic allocation functions all emit a stack dump on failure when used
>> > without __GFP_NOWARN so there is no use in emitting an additional failure
>> > message when NULL is returned.
>> > …”
>> 
>> Are you sure that's actually true?
>> 
>> A quick look around in slub.c leads me to:
>> 
>> slab_out_of_memory(struct kmem_cache *s, gfp_t gfpflags, int nid)
>> {
>> #ifdef CONFIG_SLUB_DEBUG
>
> You first have to enable EXPERT mode before you can disable SLUB_DEBUG.

I see ~175 defconfigs with CONFIG_EXPERT=y, so that's not really a high
bar unfortunately.

And there's 38 defconfigs with SLUB_DEBUG=n.

So for kernels built with those defconfigs that documentation is plain
wrong and misleading.

And then there's SLOB which doesn't dump stack anywhere AFAICS.

In fact slab_out_of_memory() doesn't emit a stack dump either, it just
prints a bunch of slab related info!

> So that hopefully means you *really* want to save memory.  It doesn't
> make sense to add a bunch of memory wasting printks when the users want
> to go to extra lengths to conserve memory.

I agree that in many cases those printks are just a waste of space in
the source and the binary and should be removed.

But I dislike being told "these generic allocation functions all emit a
stack dump" only to find out that actually they don't, they print some
other debug info, and depending on config settings they actually don't
print _anything_.

cheers
