From: "Tayar, Tomer" <Tomer.Tayar@cavium.com>
Date: Mon, 07 Aug 2017 07:40:54 +0000
Subject: RE: [PATCH] qed: Fix a memory allocation failure test in 'qed_mcp_cmd_init()'
Message-Id: <BN3PR0701MB1591F2DA114EA1D14BA3025D80B50@BN3PR0701MB1591.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170806220017.20465-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170806220017.20465-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Mintz, Yuval" <Yuval.Mintz@cavium.com>, "Elior, Ariel" <Ariel.Elior@cavium.com>, Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> We allocate 'p_info->mfw_mb_cur' and 'p_info->mfw_mb_shadow' but we
> check
> 'p_info->mfw_mb_addr' instead of 'p_info->mfw_mb_cur'.
> 
> 'p_info->mfw_mb_addr' is never 0, because it is initiliazed a few lines
> above in 'qed_load_mcp_offsets()'.
> 
> Update the test and check the result of the 2 'kzalloc()' instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks

Acked-by: Tomer Tayar <Tomer.Tayar@cavium.com>


