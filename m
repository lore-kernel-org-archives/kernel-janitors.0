From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 26 Aug 2017 01:05:58 +0000
Subject: Re: [PATCH net-next] bpf: fix oops on allocation failure
Message-Id: <20170826010556.rxoyckykv6bwg47o@ast-mbp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825202714.64ivixeindjph3z6@mwanda>
In-Reply-To: <20170825202714.64ivixeindjph3z6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 25, 2017 at 11:27:14PM +0300, Dan Carpenter wrote:
> "err" is set to zero if bpf_map_area_alloc() fails so it means we return
> ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is not
> expecting NULL returns and will oops.
> 
> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

good catch. Thanks!
Acked-by: Alexei Starovoitov <ast@kernel.org>

