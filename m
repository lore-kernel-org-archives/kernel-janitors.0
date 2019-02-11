From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2019 18:42:36 +0000
Subject: Re: [PATCH] btrfs: Silence a static checker locking warning
Message-Id: <20190211183231.GA5436@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190209090254.GC4865@kadam>
 <20190211163612.GW2900@suse.cz>
In-Reply-To: <20190211163612.GW2900@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dsterba@suse.cz, Chris Mason <clm@fb.com>, Jeff Mahoney <jeffm@suse.com>, Josef Bacik <josef@toxicpanda.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

On Mon, Feb 11, 2019 at 05:36:13PM +0100, David Sterba wrote:
> > I have re-written the code though to make it cleaner and
> > to silence the static checkers.
> 
> Maybe there's something new the static checker needs to learn.

Gar.  Yes.  You're right.  I hadn't thought about that read locks could
nest.

regards,
dan carpenter
