From: Daniel Borkmann <daniel@iogearbox.net>
Date: Sat, 22 Jul 2017 10:09:53 +0000
Subject: Re: [PATCH net-next] bpf: dev_map_alloc() shouldn't return NULL
Message-Id: <59732471.5080504@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170722074004.3abeucov67n3sbqs@mwanda>
In-Reply-To: <20170722074004.3abeucov67n3sbqs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/22/2017 09:40 AM, Dan Carpenter wrote:
> We forgot to set the error code on two error paths which means that we
> return ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is
> not expecting that and will have a NULL dereference.
>
> Fixes: 546ac1ffb70d ("bpf: add devmap, a map for storing net device references")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
