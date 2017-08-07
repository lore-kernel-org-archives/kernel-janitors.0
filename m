From: Geoff Levand <geoff@infradead.org>
Date: Mon, 07 Aug 2017 15:10:59 +0000
Subject: Re: [PATCH] block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_i
Message-Id: <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
In-Reply-To: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 08/07/2017 03:52 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 7 Aug 2017 12:37:01 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.

NACK

When a user asks me for help I would certainly like to get 
'Could not allocate cache tags' as apposed to nothing, since
the return value of ps3vram_cache_init() is not checked.

If you want to make an improvement please add a check for
success of ps3vram_cache_init() in ps3vram_probe().

-Geoff

