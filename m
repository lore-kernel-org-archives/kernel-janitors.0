From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Tue, 06 Oct 2015 13:40:22 +0000
Subject: Re: [PATCH] perf tools: fix handling read result
Message-Id: <20151006134022.GL20515@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444122017-16856-1-git-send-email-a.hajda@samsung.com>
In-Reply-To: <1444122017-16856-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org

Em Tue, Oct 06, 2015 at 11:00:17AM +0200, Andrzej Hajda escreveu:
> The function can return negative value, assigning it to unsigned
> variable can cause memory corruption.
> 
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Thanks, applied.

- Arnaldo
