From: David Miller <davem@davemloft.net>
Date: Mon, 24 Jul 2017 23:23:26 +0000
Subject: Re: [PATCH net-next] bpf: dev_map_alloc() shouldn't return NULL
Message-Id: <20170724.162326.2235132369097751651.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170722074004.3abeucov67n3sbqs@mwanda>
In-Reply-To: <20170722074004.3abeucov67n3sbqs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ast@kernel.org, john.fastabend@gmail.com, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Jul 2017 10:40:04 +0300

> We forgot to set the error code on two error paths which means that we
> return ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is
> not expecting that and will have a NULL dereference.
> 
> Fixes: 546ac1ffb70d ("bpf: add devmap, a map for storing net device references")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
