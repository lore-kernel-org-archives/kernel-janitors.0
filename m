From: Christoph Lameter <cl@linux.com>
Date: Fri, 28 Sep 2012 18:17:20 +0000
Subject: Re: [glommer-memcg:slab-common/kmalloc 28/30] include/linux/slab_def.h:135:27: warning: array subscr
Message-Id: <0000013a0e18d822-c4dfaafc-8e77-463d-97e9-000abf929191-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928102032.GA29995@localhost>
In-Reply-To: <20120928102032.GA29995@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 28 Sep 2012, Fengguang Wu wrote:

> commit: 55a6b9f968a877c728ed6e438fa68741a7711d89 [28/30] CK1 [12/13] Common names for the array of kmalloc caches

Is this issue really caused by the specified commit? I do not see how the
patch can cause such a problem.

