From: David Miller <davem@davemloft.net>
Date: Mon, 28 Aug 2017 22:23:52 +0000
Subject: Re: [PATCH net-next] bpf: fix oops on allocation failure
Message-Id: <20170828.152352.1578570740080935105.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825202714.64ivixeindjph3z6@mwanda>
In-Reply-To: <20170825202714.64ivixeindjph3z6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ast@kernel.org, john.fastabend@gmail.com, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 23:27:14 +0300

> "err" is set to zero if bpf_map_area_alloc() fails so it means we return
> ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is not
> expecting NULL returns and will oops.
> 
> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
