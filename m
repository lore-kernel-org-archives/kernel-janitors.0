From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 01 Feb 2020 19:41:56 +0000
Subject: Re: [PATCH net] qed: Fix a error code in qed_hw_init()
Message-Id: <20200201114156.33e77496@cakuba.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131050326.n3axoo7axxvzcrv3@kili.mountain>
In-Reply-To: <20200131050326.n3axoo7axxvzcrv3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ariel Elior <ariel.elior@marvell.com>, Michal Kalderon <michal.kalderon@marvell.com>, GR-everest-linux-l2@marvell.com, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 31 Jan 2020 08:03:26 +0300, Dan Carpenter wrote:
> If the qed_fw_overlay_mem_alloc() then we should return -ENOMEM instead
> of success.
> 
> Fixes: 30d5f85895fa ("qed: FW 8.42.2.0 Add fw overlay feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan!
