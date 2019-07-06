From: David Rientjes <rientjes@google.com>
Date: Sat, 06 Jul 2019 22:45:10 +0000
Subject: Re: [PATCH] mm/slab: One function call less in verify_redzone_free()
Message-Id: <alpine.DEB.2.21.1907061542480.103032@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c724416e-c8bc-6927-00c5-7a4c433c562f@web.de> <0100016bc3579800-ee6cd00b-6f59-4d86-be0c-f63e2b137d18-000000@email.amazonses.com>
In-Reply-To: <0100016bc3579800-ee6cd00b-6f59-4d86-be0c-f63e2b137d18-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Lameter <cl@linux.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 5 Jul 2019, Christopher Lameter wrote:

> On Fri, 5 Jul 2019, Markus Elfring wrote:
> 
> > Avoid an extra function call by using a ternary operator instead of
> > a conditional statement for a string literal selection.
> 
> Well. I thought the compiler does that on its own? And the tenary operator
> makes the code difficult to read.
> 

Right, and I don't understand the changelog: yes, there's one less 
function call in the source but functionally there's still a conditional; 
this isn't even optimizing DEBUG builds.
