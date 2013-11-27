From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 27 Nov 2013 09:41:35 +0000
Subject: Re: [PATCH] kernel/fork.c: make dup_mm() static
Message-Id: <20131127094135.GW10022@twins.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1806554.PvRgdrjSaq@daeseok-laptop>
In-Reply-To: <1806554.PvRgdrjSaq@daeseok-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 27, 2013 at 12:10:03PM +0900, Daeseok Youn wrote:
> From 50e7d2058f0502e9c9138d5c0c75c8492ab8ed6a Mon Sep 17 00:00:00 2001
> From: Daeseok Youn <daeseok.youn@lge.com>
> Date: Wed, 27 Nov 2013 10:17:59 +0900
> Subject: [PATCH] kernel/fork.c: make dup_mm() static

Strictly speaking you need a Changelog explaining what, why and how. I
suppose here a simple: 

Make dup_mm() static as its not used elsewhere.

Will suffice.

> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>

Andrew, do you want this one or shall I take it?
