From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Dec 2013 11:57:03 +0000
Subject: Re: [PATCH] proposed consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131203115703.GP5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131202145646.GA5126@opentech.at>
In-Reply-To: <20131202145646.GA5126@opentech.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 03, 2013 at 12:30:32AM +0100, Nicholas Mc Guire wrote:
> > 
> > This is not the patch which introduced spin_unlock_wait().  That
> > function was around before we adopted git.
> >
> 
> used git blame to find that - how would I find this information or is
> it not relevant to include it ?
>  

If it's older than git then forget about it.

regards,
dan carpenter

