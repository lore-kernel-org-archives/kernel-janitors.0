From: David Sterba <dsterba@suse.cz>
Date: Tue, 02 Jan 2018 15:52:31 +0000
Subject: Re: [PATCH] btrfs: qgroup: remove unused label 'retry'
Message-Id: <20180102155231.GT3553@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222005508.11975-1-colin.king@canonical.com>
In-Reply-To: <20171222005508.11975-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 22, 2017 at 12:55:08AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Label 'retry' is not used, remove it. Cleans up a clang build
> warning:
> 
> warning: label ‘retry’ defined but not used [-Wunused-label]
> 
> Fixes: b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on getting EDQUOT"")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, we already have another patch to fix that in for-next.
