From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Sep 2012 06:56:47 +0000
Subject: Re: [PATCH v2] sound: Remove unnecessary semicolon
Message-Id: <20120928065647.GM4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348746198-26375-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1348746198-26375-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: trivial@vger.kernel.org, perex@perex.cz, tiwai@suse.de, rusty@rustcorp.com.au, paul.gortmaker@windriver.com, eblennerhassett@audioscience.com, superquad.vortex2@gmail.com, den@openvz.org, kozerkov@parallels.com, axel.lin@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2012 at 01:43:18PM +0200, Peter Senna Tschudin wrote:
> Remove unnecessary semicolon
> 
> And:
> sound/drivers/vx/vx_pcm.c: Convert spaces into tab
> 
> Found by http://coccinelle.lip6.fr/
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---

Next time, could you put a little comment here under the --- line
about what changed between v1 and v2?

regards,
dan carpenter

