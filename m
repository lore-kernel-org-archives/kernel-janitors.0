From: Mike Rapoport <rppt@kernel.org>
Date: Thu, 14 Jan 2021 13:38:07 +0000
Subject: Re: [PATCH] mm: memblock: remove return value of memblock_free_all()
Message-Id: <20210114133807.GK1106298@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210114070817.GA2868715@AD01715016>
In-Reply-To: <20210114070817.GA2868715@AD01715016>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 14, 2021 at 04:08:17PM +0900, Daeseok Youn wrote:
> No one checks the return value of memblock_free_all().
> Make the return value void.
> 
> memblock_free_all() is used on mem_init() for each
> architecture, and the total count of freed pages will be added
> to _totalram_pages variable by calling totalram_pages_add().
> 
> so do not need to return total count of freed pages.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>

Applied to memblock/for-next, thanks!

-- 
Sincerely yours,
Mike.
