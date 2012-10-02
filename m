From: Christoph Lameter <cl@linux.com>
Date: Tue, 02 Oct 2012 18:06:24 +0000
Subject: Re: [glommer-memcg:slab-common/slabinfo 13/20] mm/slab.c:2479:52: error: 'align' undeclared
Message-Id: <0000013a22a84685-abe35bef-ef70-44ab-851d-2367b80ef3ae-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2 Oct 2012, Fengguang Wu wrote:

> mm/slab.c: In function '__kmem_cache_create':
> mm/slab.c:2479:52: error: 'align' undeclared (first use in this function)
> mm/slab.c:2479:52: note: each undeclared identifier is reported only once for each function it appears in

There was a fix posted for that issue on linux-mm in the last few days.
Pekka should have picked it up.
