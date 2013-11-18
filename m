From: David Sterba <dsterba@suse.cz>
Date: Mon, 18 Nov 2013 10:57:17 +0000
Subject: Re: [patch] Btrfs: fix access_ok() check in btrfs_ioctl_send()
Message-Id: <20131118105717.GB5007@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131021123004.GI1032@twin.jikos.cz>
In-Reply-To: <20131021123004.GI1032@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jbacik@fusionio.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 21, 2013 at 02:30:05PM +0200, David Sterba wrote:
> On Thu, Jan 10, 2013 at 11:57:25AM +0300, Dan Carpenter wrote:
> > The closing parenthesis is in the wrong place.  We want to check
> > "sizeof(*arg->clone_sources) * arg->clone_sources_count" instead of
> > "sizeof(*arg->clone_sources * arg->clone_sources_count)".
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Original message id: <20130110085725.GA23063@elgon.mountain>
> 
> This patch hasn't been applied.

Please add this patch to btrfs-next.

david
