From: David Sterba <dsterba@suse.cz>
Date: Tue, 09 May 2017 15:28:44 +0000
Subject: Re: [PATCH] btrfs: remove redundant assignment and check on variable ret
Message-Id: <20170509152844.GF5491@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170506220105.13206-1-colin.king@canonical.com>
In-Reply-To: <20170506220105.13206-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 06, 2017 at 11:01:05PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ret is assigned to zero and is always zero throughout the
> function.  Thus the check for ret being less than zero is always
> false and so mapping_set_error always has an -EIO error passed to
> it.  Hence we can remove the redundant assignment and check on ret.
> 
> Detected by CoverityScan, CID#1414312 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: David Sterba <dsterba@suse.com>
