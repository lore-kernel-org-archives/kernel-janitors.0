From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 11:13:39 +0000
Subject: Re: [PATCH net] qed: off by one in qed_parse_mcp_trace_buf()
Message-Id: <20180705.201339.710864685744249799.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704095236.l3ub5au4jhoihk3g@kili.mountain>
In-Reply-To: <20180704095236.l3ub5au4jhoihk3g@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Ariel.Elior@cavium.com, Michal.Kalderon@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Jul 2018 12:52:36 +0300

> If format_idx = s_mcp_trace_meta.formats_num then we read one element
> beyond the end of the s_mcp_trace_meta.formats[] array.
> 
> Fixes: 50bc60cb155c ("qed*: Utilize FW 8.33.11.0")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
