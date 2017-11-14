From: David Miller <davem@davemloft.net>
Date: Tue, 14 Nov 2017 13:01:28 +0000
Subject: Re: [PATCH net-next] liquidio: Missing error code in liquidio_init_nic_module()
Message-Id: <20171114.220128.1580138309209764002.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171114061417.ejguuk3tef3lq4r5@mwanda>
In-Reply-To: <20171114061417.ejguuk3tef3lq4r5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: derek.chickles@caviumnetworks.com, vijaya.guvva@cavium.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 09:14:17 +0300

> We accidentally return success if lio_vf_rep_modinit() fails instead of
> propogating the error code.
> 
> Fixes: e20f469660ad ("liquidio: synchronize VF representor names with NIC firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
