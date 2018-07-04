From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:18 +0000
Subject: Re: [PATCH] qed: remove redundant pointer 'name'
Message-Id: <20180704.224118.175574153412257056.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704120626.8701-1-colin.king@canonical.com>
In-Reply-To: <20180704120626.8701-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 13:06:26 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'name' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'name' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
