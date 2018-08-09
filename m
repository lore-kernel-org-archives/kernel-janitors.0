From: David Miller <davem@davemloft.net>
Date: Thu, 09 Aug 2018 21:17:16 +0000
Subject: Re: [PATCH] ethernet/qlogic: remove unused array msi_tgt_status
Message-Id: <20180809.141716.99089830506080659.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808180427.14864-1-colin.king@canonical.com>
In-Reply-To: <20180808180427.14864-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: harish.patil@cavium.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  8 Aug 2018 19:04:27 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array msi_tgt_status is defined but never used, hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: 'msi_tgt_status' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
