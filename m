From: Bojan Smojver <bojan@rexursive.com>
Date: Fri, 07 Oct 2011 20:58:18 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <1318021098.1965.1.camel@shrek.rexursive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2011-10-07 at 16:24 +0300, Dan Carpenter wrote:
> These lines break if "data" is NULL.
>         if (data[thr].thr)
>                 kthread_stop(data[thr].thr); 

Thanks - good catch. I'm an idiot. Will fix.

This whole thing has been pulled for now, because Rafael got some panics
with it. I'm working on a new patch that will also produce a SHA1 of the
image, so that we know for sure we read in the right thing.

-- 
Bojan

