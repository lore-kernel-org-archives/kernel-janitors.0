From: Jens Axboe <jaxboe@fusionio.com>
Date: Mon, 13 Sep 2010 12:09:00 +0000
Subject: Re: [patch] cciss: freeing uninitialized data on error path
Message-Id: <4C8E145C.4020204@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100911233947.GC25351@bicker>
In-Reply-To: <20100911233947.GC25351@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2010-09-12 01:39, Dan Carpenter wrote:
> The "h->scatter_list" is allocated inside a for loop.  If any of those
> allocations fail, then the rest of the list is uninitialized data.  When
> we free it we should start from the top and free backwards so that we
> don't call kfree() on uninitialized pointers.
> 
> Also if the allocation for "h->scatter_list" fails then we would get an
> Oops here.  I should have noticed this when I send: 4ee69851c "cciss:
> handle allocation failure."  but I didn't.  Sorry about that.

Thanks Dan, applied.

-- 
Jens Axboe

