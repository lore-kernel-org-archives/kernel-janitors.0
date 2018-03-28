From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 28 Mar 2018 13:25:44 +0000
Subject: Re: [PATCH] test_bpf: Fix NULL vs IS_ERR() check in test_skb_segment()
Message-Id: <beeb26cb-5073-c7c7-fdec-5cf62cfe113d@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328114836.GD29050@mwanda>
In-Reply-To: <20180328114836.GD29050@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Yonghong Song <yhs@fb.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/28/2018 01:48 PM, Dan Carpenter wrote:
> The skb_segment() function returns error pointers on error.  It never
> returns NULL.
> 
> Fixes: 76db8087c4c9 ("net: bpf: add a test for skb_segment in test_bpf module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch is directly for net-next, thanks!

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
