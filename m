From: Tejun Heo <tj@kernel.org>
Date: Mon, 02 Jul 2018 14:48:16 +0000
Subject: Re: [PATCH] sata_nv: remove redundant pointers sdev0 and sdev1
Message-Id: <20180702144816.GA533219@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702073022.10000-1-colin.king@canonical.com>
In-Reply-To: <20180702073022.10000-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 02, 2018 at 08:30:22AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointers sdev0 and sdev1 are being assigned but are never used hence they
> are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'sdev0' set but not used [-Wunused-but-set-variable]
> warning: variable 'sdev1' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to libata/for-4.18-fixes.

Thanks.

-- 
tejun
