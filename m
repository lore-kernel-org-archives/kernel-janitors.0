From: Max Gurtovoy <maxg@mellanox.com>
Date: Sun, 17 Mar 2019 10:05:28 +0000
Subject: Re: [PATCH] IB/iser: remove uninitialized variable len
Message-Id: <fe379614-5b0c-4063-2153-bd8a792d51c6@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190316230512.8933-1-colin.king@canonical.com>
In-Reply-To: <20190316230512.8933-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sagi Grimberg <sagi@grimberg.me>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 3/17/2019 1:05 AM, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
>
> The variable len is not being inintialized and the uninitialized
> value is being returned. However, this return path is never reached
> because the default case in the switch statement returns -ENOSYS.
> Clean up the code by replacing the return -ENOSYS with a break
> for the default case and returning -ENOSYS at the end of the
> function.  This allows len to be removed.  Also remove redundant
> break that follows a return statement.
>
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Looks good,

Reviewed-by: Max Gurtovoy <maxg@mellanox.com>
