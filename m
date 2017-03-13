From: Alan Cox <alan@linux.intel.com>
Date: Mon, 13 Mar 2017 17:54:46 +0000
Subject: Re: [PATCH] staging: atomisp: use k{v}zalloc instead of k{v}alloc and memset
Message-Id: <1489427686.24765.9.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170313105421.GA32342@SEL-JYOUN-D1>
In-Reply-To: <20170313105421.GA32342@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2017-03-13 at 19:54 +0900, Daeseok Youn wrote:
> If the atomisp_kernel_zalloc() has "true" as a second parameter, it
> tries to allocate zeroing memory from kmalloc(vmalloc) and memset.
> But using kzalloc is rather than kmalloc followed by memset with 0.
> (vzalloc is for same reason with kzalloc)

This is true but please don't apply this. There are about five other
layers of indirection for memory allocators that want removing first so
that the driver just uses the correct kmalloc/kzalloc/kv* functions in
the right places.

Alan

