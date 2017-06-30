From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Fri, 30 Jun 2017 13:10:46 +0000
Subject: Re: [PATCH] selinux: return -ENOMEM if kzalloc() fails
Message-Id: <201706302210.GCA05089.MFFOtQVJSOLHOF@I-love.SAKURA.ne.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630075614.ywv3y3tptor5ox7g@mwanda>
	<1498826894.16913.1.camel@tycho.nsa.gov>
In-Reply-To: <1498826894.16913.1.camel@tycho.nsa.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

Stephen Smalley wrote:
> On Fri, 2017-06-30 at 10:56 +0300, Dan Carpenter wrote:
> > We accidentally return success instead of -ENOMEM on this failure
> > path.
> > 
> > Fixes: 409dcf31538a ("selinux: Add a cache for quicker retreival of
> > PKey SIDs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> NAK, that's intentional.  See the comment just above the code in
> question.

If allocation failure is no problem, please consider using
GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN instead of
GFP_ATOMIC, for memory reserves is mainly targeted for OOM victims.
