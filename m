From: David Miller <davem@davemloft.net>
Date: Wed, 27 May 2020 18:23:49 +0000
Subject: Re: [PATCH][V2][net-next] mlxsw: spectrum_router: remove redundant initialization of pointer br_dev
Message-Id: <20200527.112349.724631175356044481.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527081555.124615-1-colin.king@canonical.com>
In-Reply-To: <20200527081555.124615-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, idosch@mellanox.com, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 09:15:55 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer br_dev is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
