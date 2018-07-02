From: David Miller <davem@davemloft.net>
Date: Mon, 02 Jul 2018 13:47:34 +0000
Subject: Re: [PATCH] atm: zatm: remove redundant pointer zatm_dev
Message-Id: <20180702.224734.1604662654586704645.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702073721.10272-1-colin.king@canonical.com>
In-Reply-To: <20180702073721.10272-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  2 Jul 2018 08:37:21 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer zatm_dev is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'zatm_dev' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
