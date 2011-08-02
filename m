From: Chris Metcalf <cmetcalf@tilera.com>
Date: Tue, 02 Aug 2011 20:28:39 +0000
Subject: Re: [PATCH 11/11] arch/tile/mm/init.c: trivial: use BUG_ON
Message-Id: <4E385DF7.5010206@tilera.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk> <1312281304-11847-12-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-12-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kernel@vger.kernel.org

On 8/2/2011 6:35 AM, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Use BUG_ON(x) rather than if(x) BUG();

Thanks, accepted into the tile tree.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com

