From: James Morris <jmorris@namei.org>
Date: Sun, 15 Aug 2010 23:19:16 +0000
Subject: Re: [patch] tomoyo: cleanup.  don't store bogus pointer
Message-Id: <alpine.LRH.2.00.1008160919080.14791@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807221751.GD9031@bicker>
In-Reply-To: <20100807221751.GD9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 10 Aug 2010, Tetsuo Handa wrote:

> Dan Carpenter wrote:
> 
> > If domain is NULL then &domain->list is a bogus address.  Let's leave
> > head->r.domain NULL instead of saving an unusable pointer.
> > 
> > This is just a cleanup.  The current code always checks head->r.eof
> > before dereferencing head->r.domain.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> I see. Thank you.
> 
> Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
