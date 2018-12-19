From: David Miller <davem@davemloft.net>
Date: Wed, 19 Dec 2018 06:03:44 +0000
Subject: Re: [PATCH] vxge: ensure data0 is initialized in when fetching firmware version information
Message-Id: <20181218.220344.197132278908226283.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218151947.31406-1-colin.king@canonical.com>
In-Reply-To: <20181218151947.31406-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jdmason@kudzu.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Dec 2018 15:19:47 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently variable data0 is not being initialized so a garbage value is
> being passed to vxge_hw_vpath_fw_api and this value is being written to
> the rts_access_steer_data0 register.  There are other occurrances where
> data0 is being initialized to zero (e.g. in function
> vxge_hw_upgrade_read_version) so I think it makes sense to ensure data0
> is initialized likewise to 0.
> 
> Detected by CoverityScan, CID#140696 ("Uninitialized scalar variable")
> 
> Fixes: 8424e00dfd52 ("vxge: serialize access to steering control register")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
