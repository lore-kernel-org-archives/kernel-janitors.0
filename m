From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 16:34:36 +0000
Subject: Re: [patch -next] lockd: double unlock in next_host_state()
Message-Id: <20110103163403.GY1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110102202042.GN1886@bicker>
 <001458D4-F513-4959-9BE7-476F8542D009@oracle.com>
In-Reply-To: <001458D4-F513-4959-9BE7-476F8542D009@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 03, 2011 at 10:59:36AM -0500, Chuck Lever wrote:
> > -			mutex_unlock(&nlm_host_mutex);
> > 			goto out;
> > 		}
> > 	}
> 
> Would it also make sense to replace the "goto out;" with a "break;" ?

No.  for_each_host() is a nested for loop, so a break would only take
you out of the inner most loop.

regards,
dan carpenter

