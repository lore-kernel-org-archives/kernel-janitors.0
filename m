From: Christopher Lameter <cl@linux.com>
Date: Fri, 05 Jul 2019 18:13:46 +0000
Subject: Re: [PATCH] mm/slab: One function call less in verify_redzone_free()
Message-Id: <0100016bc3579800-ee6cd00b-6f59-4d86-be0c-f63e2b137d18-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c724416e-c8bc-6927-00c5-7a4c433c562f@web.de>
In-Reply-To: <c724416e-c8bc-6927-00c5-7a4c433c562f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 5 Jul 2019, Markus Elfring wrote:

> Avoid an extra function call by using a ternary operator instead of
> a conditional statement for a string literal selection.

Well. I thought the compiler does that on its own? And the tenary operator
makes the code difficult to read.
