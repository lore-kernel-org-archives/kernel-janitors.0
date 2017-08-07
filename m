From: Joe Perches <joe@perches.com>
Date: Mon, 07 Aug 2017 15:13:40 +0000
Subject: Re: [PATCH] block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_i
Message-Id: <1502118820.2219.19.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
 <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
In-Reply-To: <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Levand <geoff@infradead.org>, SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 2017-08-07 at 08:10 -0700, Geoff Levand wrote:
> On 08/07/2017 03:52 AM, SF Markus Elfring wrote:
> > Omit an extra message for a memory allocation failure in this function.
> NACK
> 
> When a user asks me for help I would certainly like to get 
> 'Could not allocate cache tags' as apposed to nothing, since
> the return value of ps3vram_cache_init() is not checked.

You still get a dump_stack on alloc failure.

