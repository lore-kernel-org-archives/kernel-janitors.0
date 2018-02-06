From: David Sterba <dsterba@suse.cz>
Date: Tue, 06 Feb 2018 14:44:42 +0000
Subject: Re: [PATCH][btrfs-next] btrfs: remove redundant check on ret and goto
Message-Id: <20180206144442.GA31890@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180112165258.27431-1-colin.king@canonical.com>
In-Reply-To: <20180112165258.27431-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, Liu Bo <bo.li.liu@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 12, 2018 at 04:52:58PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for a non-zero ret is redundant as the goto will jump to
> the very next statement anyway.  Remove this extraneous code.
> 
> Detected by CoverityScan, CID#1463784 ("Identical code for different
> branches")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Added to next, thanks.
