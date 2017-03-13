From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Mar 2017 11:51:29 +0000
Subject: Re: [PATCH] staging: atomisp: use k{v}zalloc instead of k{v}alloc and memset
Message-Id: <20170313115129.GC4136@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170313105421.GA32342@SEL-JYOUN-D1>
In-Reply-To: <20170313105421.GA32342@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: mchehab@kernel.org, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, alan@linux.intel.com, linux-media@vger.kernel.org

On Mon, Mar 13, 2017 at 07:54:21PM +0900, Daeseok Youn wrote:
> If the atomisp_kernel_zalloc() has "true" as a second parameter, it
> tries to allocate zeroing memory from kmalloc(vmalloc) and memset.
> But using kzalloc is rather than kmalloc followed by memset with 0.
> (vzalloc is for same reason with kzalloc)
> 
> And also atomisp_kernel_malloc() can be used with
> atomisp_kernel_zalloc(<size>, false);
> 

We should just change all the callers to kvmalloc() and kvzmalloc().

regards,
dan carpenter

