From: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 08 Jul 2014 16:21:28 +0000
Subject: Re: dm: fix an error code in local_init()
Message-Id: <20140708162127.GA23439@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140708105536.GC19737@mwanda>
In-Reply-To: <20140708105536.GC19737@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alasdair Kergon <agk@redhat.com>, linux-raid@vger.kernel.org, dm-devel@redhat.com, kernel-janitors@vger.kernel.org

On Tue, Jul 08 2014 at  6:55am -0400,
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We return success if we can't allocate a work queue but we should return
> -ENOMEM.  The code was a bit messy so that's why this small bug was
> introduced and I have cleaned that as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!  I folded your fix into the commit that introduced this bug
because that commit was marked for stable and will be sent to Linus
shortly.  See the new rebased commit here:

https://git.kernel.org/cgit/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=for-next&idXf3fce6ee8c37c1c18f36439102d5cccc5363c8
