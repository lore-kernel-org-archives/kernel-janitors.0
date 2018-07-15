From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Sun, 15 Jul 2018 06:48:27 +0000
Subject: Re: [PATCH] thunderbolt: remove redundant variable 'approved'
Message-Id: <20180715064827.GD2534@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713085725.32099-1-colin.king@canonical.com>
In-Reply-To: <20180713085725.32099-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 13, 2018 at 09:57:25AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'approved' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'approved' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to thunderbolt.git/next, thanks!
