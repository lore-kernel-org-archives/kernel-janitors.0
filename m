From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 25 Aug 2017 20:47:09 +0000
Subject: Re: [PATCH net-next] bpf: fix oops on allocation failure
Message-Id: <59A08CCD.2050603@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825202714.64ivixeindjph3z6@mwanda>
In-Reply-To: <20170825202714.64ivixeindjph3z6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/25/2017 10:27 PM, Dan Carpenter wrote:
> "err" is set to zero if bpf_map_area_alloc() fails so it means we return
> ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is not
> expecting NULL returns and will oops.
>
> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
