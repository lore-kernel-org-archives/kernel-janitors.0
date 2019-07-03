From: David Miller <davem@davemloft.net>
Date: Wed, 03 Jul 2019 18:32:51 +0000
Subject: Re: [PATCH] atl1c: remove redundant assignment to variable tpd_req
Message-Id: <20190703.113251.510128079502437520.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190703075358.12470-1-colin.king@canonical.com>
In-Reply-To: <20190703075358.12470-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  3 Jul 2019 08:53:58 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tpd_req is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
