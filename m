From: David Sterba <dsterba@suse.cz>
Date: Fri, 11 Mar 2016 16:20:52 +0000
Subject: Re: [patch] btrfs: scrub: silence an uninitialized variable warning
Message-Id: <20160311162052.GX18908@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311080856.GB31887@mwanda>
In-Reply-To: <20160311080856.GB31887@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 11, 2016 at 11:08:56AM +0300, Dan Carpenter wrote:
> It's basically harmless if "ref_level" isn't initialized since it's only
> used for an error message, but it causes a static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: David Sterba <dsterba@suse.com>
