From: Ido Schimmel <idosch@idosch.org>
Date: Wed, 27 May 2020 09:00:11 +0000
Subject: Re: [PATCH][V2][net-next] mlxsw: spectrum_router: remove redundant initialization of pointer br_dev
Message-Id: <20200527090011.GA1519147@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527081555.124615-1-colin.king@canonical.com>
In-Reply-To: <20200527081555.124615-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 27, 2020 at 09:15:55AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer br_dev is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Thanks
