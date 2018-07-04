From: "Tayar, Tomer" <Tomer.Tayar@cavium.com>
Date: Wed, 04 Jul 2018 10:45:18 +0000
Subject: RE: [PATCH net] qed: off by one in qed_parse_mcp_trace_buf()
Message-Id: <BN3PR07MB25478CA55F5A9C54C36795EB80410@BN3PR07MB2547.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704095236.l3ub5au4jhoihk3g@kili.mountain>
In-Reply-To: <20180704095236.l3ub5au4jhoihk3g@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Elior, Ariel" <Ariel.Elior@cavium.com>, "Kalderon, Michal" <Michal.Kalderon@cavium.com>
Cc: Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
Sent: Wednesday, July 04, 2018 12:53 PM

> If format_idx == s_mcp_trace_meta.formats_num then we read one element
> beyond the end of the s_mcp_trace_meta.formats[] array.
> 
> Fixes: 50bc60cb155c ("qed*: Utilize FW 8.33.11.0")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks
Acked-by: Tomer Tayar <Tomer.Tayar@cavium.com>
