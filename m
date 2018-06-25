From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Mon, 25 Jun 2018 01:47:09 +0000
Subject: Re: [PATCH] mm/zsmalloc: make several functions and a struct static
Message-Id: <20180625014709.GC557@jagdpanzerIV>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180624213322.13776-1-colin.king@canonical.com>
In-Reply-To: <20180624213322.13776-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On (06/24/18 22:33), Colin King wrote:
> The functions zs_page_isolate, zs_page_migrate, zs_page_putback,
> lock_zspage, trylock_zspage and structure zsmalloc_aops are local to
> source and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'zs_page_isolate' was not declared. Should it be static?
> symbol 'zs_page_migrate' was not declared. Should it be static?
> symbol 'zs_page_putback' was not declared. Should it be static?
> symbol 'zsmalloc_aops' was not declared. Should it be static?
> symbol 'lock_zspage' was not declared. Should it be static?
> symbol 'trylock_zspage' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
