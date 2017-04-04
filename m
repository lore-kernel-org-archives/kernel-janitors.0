From: "Tayar, Tomer" <Tomer.Tayar@cavium.com>
Date: Tue, 04 Apr 2017 06:13:04 +0000
Subject: RE: [PATCH -next] qed: Add a missing error code
Message-Id: <SN2PR07MB2623C0A41E3F1786DC08CC71800B0@SN2PR07MB2623.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403182522.GA32592@mwanda>
In-Reply-To: <20170403182522.GA32592@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Mintz, Yuval" <Yuval.Mintz@cavium.com>
Cc: "Elior, Ariel" <Ariel.Elior@cavium.com>, Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> We should be returning -ENOMEM if qed_mcp_cmd_add_elem() fails.  The
> current code returns success.
> 
> Fixes: 4ed1eea82a21 ("qed: Revise MFW command locking")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks

Acked-by: Tomer Tayar <Tomer.Tayar@cavium.com>

