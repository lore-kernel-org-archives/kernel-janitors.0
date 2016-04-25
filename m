From: David Sterba <dsterba@suse.cz>
Date: Mon, 25 Apr 2016 12:49:05 +0000
Subject: Re: [patch] btrfs: send: silence an integer overflow warning
Message-Id: <20160425124905.GJ23222@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413064059.GB8092@mwanda>
In-Reply-To: <20160413064059.GB8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 13, 2016 at 09:40:59AM +0300, Dan Carpenter wrote:
> The "sizeof(*arg->clone_sources) * arg->clone_sources_count" expression
> can overflow.  It causes several static checker warnings.  It's all
> under CAP_SYS_ADMIN so it's not that serious but lets silence the
> warnings.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: David Sterba <dsterba@suse.com>
