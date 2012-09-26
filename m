From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 26 Sep 2012 10:46:50 +0000
Subject: Re: [PATCH] mm/slab: Fix kmem_cache_alloc_node_trace() declaration
Message-Id: <CALF0-+WYRrC544p-JBYXZzacbGW5FpNM0p17Nrp+-49KTFhuDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
	<1348571229-844-2-git-send-email-elezegarcia@gmail.com>
	<alpine.DEB.2.00.1209252115000.28360@chino.kir.corp.google.com>
	<CALF0-+UZj-cunn-+AW0N6_oi1j9VFH8btKV1pvhjtVFiVsE1yQ@mail.gmail.com>
	<CAOJsxLHBENuus5+isE8ucKUAqVHwaYHuGxOqgGmtPC-2TYri3A@mail.gmail.com>
In-Reply-To: <CAOJsxLHBENuus5+isE8ucKUAqVHwaYHuGxOqgGmtPC-2TYri3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>, kernel-janitors@vger.kernel.org, linux-mm@kvack.org, fengguang.wu@intel.com

On Wed, Sep 26, 2012 at 7:42 AM, Pekka Enberg <penberg@kernel.org> wrote:
> On Wed, Sep 26, 2012 at 1:09 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>> Yes. I just asked Pekka to revert this patch altogether.
>> The original patch was meant to match SLAB and SLUB, and this
>> fix should maintain that. But instead I fix it the wrong way.
>>
>> I'll send another one.
>
> Okay, I'm now confused and somewhat unhappy. What commits do you want
> me to nuke exactly?

From your slab/tracing topic branch:

1e5965bf1f018cc30a4659fa3f1a40146e4276f6
mm/slab: Fix kmem_cache_alloc_node_trace() declaration

Thanks,
Ezequiel.
