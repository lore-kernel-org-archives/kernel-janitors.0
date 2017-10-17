From: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Tue, 17 Oct 2017 11:26:32 +0000
Subject: Re: [PATCH] mm/rmap: remove redundant variable cend
Message-Id: <20171017112632.xsx4ejefkteybem3@node.shutemov.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011174942.1372-1-colin.king@canonical.com>
In-Reply-To: <20171011174942.1372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Minchan Kim <minchan@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 11, 2017 at 06:49:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable cend is set but never read, hence it is redundant and can be
> removed.
> 
> Cleans up clang build warning: Value stored to 'cend' is never read
> 
> Fixes: 369ea8242c0f ("mm/rmap: update to new mmu_notifier semantic v2")

I'm not sure if should consider warning fix as a fix. :)

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
