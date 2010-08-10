From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Tue, 10 Aug 2010 06:56:24 +0000
Subject: Re: [patch] tomoyo: cleanup.  don't store bogus pointer
Message-Id: <201008100656.o7A6uOS0093945@www262.sakura.ne.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807221751.GD9031@bicker>
In-Reply-To: <20100807221751.GD9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter wrote:

> If domain is NULL then &domain->list is a bogus address.  Let's leave
> head->r.domain NULL instead of saving an unusable pointer.
> 
> This is just a cleanup.  The current code always checks head->r.eof
> before dereferencing head->r.domain.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

I see. Thank you.

Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
