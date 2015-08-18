From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Aug 2015 10:38:24 +0000
Subject: Re: [patch] cxgb4: memory corruption in debugfs
Message-Id: <20150818103824.GI5610@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150818093144.GG3965@mwanda>
 <201508181928.JGB95875.OHOtSVLFMFFJQO@I-love.SAKURA.ne.jp>
In-Reply-To: <201508181928.JGB95875.OHOtSVLFMFFJQO@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 18, 2015 at 07:28:53PM +0900, Tetsuo Handa wrote:
> Dan Carpenter wrote:
> > You can't use kstrtoul() with an int or it causes memory corruption.
> > Also j should be unsigned or we have underflow bugs.
> > 
> > I considered changing "j" to unsigned long but everything fits in a u32.
> 
> Excuse me, but kstrtouint()'s last argument is not "u32 *" but "unsigned int *".
> Aren't there architectures where sizeof(unsigned int) > sizeof(u32) ?

No.

regards,
dan carpenter

