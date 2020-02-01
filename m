From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 01 Feb 2020 19:41:39 +0000
Subject: Re: [PATCH net] octeontx2-pf: Fix an IS_ERR() vs NULL bug
Message-Id: <20200201114139.725a6f95@cakuba.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131050241.aoqatlxubobkmi4y@kili.mountain>
In-Reply-To: <20200131050241.aoqatlxubobkmi4y@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, "David S. Miller" <davem@davemloft.net>, Tomasz Duszynski <tduszynski@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 31 Jan 2020 08:02:41 +0300, Dan Carpenter wrote:
> The otx2_mbox_get_rsp() function never returns NULL, it returns error
> pointers on error.
> 
> Fixes: 34bfe0ebedb7 ("octeontx2-pf: MTU, MAC and RX mode config support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied
