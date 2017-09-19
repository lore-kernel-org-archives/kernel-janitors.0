From: Tejun Heo <tj@kernel.org>
Date: Tue, 19 Sep 2017 03:24:52 +0000
Subject: Re: [PATCH] ata: pata_artop: remove redundant initialization of pio
Message-Id: <20170919032452.GN378890@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170914185418.13790-1-colin.king@canonical.com>
In-Reply-To: <20170914185418.13790-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 14, 2017 at 07:54:18PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> pio is initialized and the data is never read, instead it is almost
> immediately being updated to a new value. Fix this by removing the
> initialization.
> 
> Detected by scan-build:
> "warning: Value stored to 'pio' during its initialization is never read"
> 
> Fixes: 669a5db411d8 ("[libata] Add a bunch of PATA drivers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to libata/for-4.15.

Thanks.

-- 
tejun
