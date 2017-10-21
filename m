From: Tejun Heo <tj@kernel.org>
Date: Sat, 21 Oct 2017 16:25:57 +0000
Subject: Re: [PATCH] ata: sata_mv: remove a redundant assignment to pointer ehi
Message-Id: <20171021162557.GS1302522@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016110011.11048-1-colin.king@canonical.com>
In-Reply-To: <20171016110011.11048-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 16, 2017 at 12:00:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer ehi is being assigned to a value that is never read
> and is redundant.  Clean up the code and move the ehi declaration
> and initialization to the code block where it is used. Cleans up
> clang warning: Value stored to 'ehi' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to libata/for-4.15.

Thanks.

-- 
tejun
