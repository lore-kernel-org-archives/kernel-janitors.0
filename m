From: Geoff Levand <geoff.levand@am.sony.com>
Date: Tue, 12 Oct 2010 16:01:07 +0000
Subject: Re: [patch] ps3disk: passing wrong variable to bvec_kunmap_irq()
Message-Id: <4CB48643.6050900@am.sony.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011191335.GH5851@bicker>
In-Reply-To: <20101011191335.GH5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "cbe-oss-dev@lists.ozlabs.org" <cbe-oss-dev@lists.ozlabs.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Geoff Levand <geoff@infradead.org>, Jens Axboe <jaxboe@fusionio.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On 10/11/2010 12:13 PM, Dan Carpenter wrote:
> This should pass "buf" to bvec_kunmap_irq() instead of "bv".  The api is
> like kmap_atomic() instead of kmap().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good.  Thanks.

Acked-by: Geoff Levand <geoff@infradead.org>

