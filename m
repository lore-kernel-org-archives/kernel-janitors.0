From: Tejun Heo <tj@kernel.org>
Date: Tue, 27 Mar 2018 13:57:05 +0000
Subject: Re: [PATCH][next] libata: ensure host is free'd on error exit paths
Message-Id: <20180327135705.GK1840639@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180327132601.12749-1-colin.king@canonical.com>
In-Reply-To: <20180327132601.12749-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 27, 2018 at 02:26:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The host structure is not being kfree'd on two error exit paths
> leading to memory leaks. Add in new err_free label and kfree host.
> 
> Detected by CoverityScan, CID#1466103 ("Resource leak")
> 
> Fixes: 2623c7a5f279 ("libata: add refcounting to ata_host")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to libata/for-4.17.

Thanks.

-- 
tejun
