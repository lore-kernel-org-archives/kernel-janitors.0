From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Jul 2018 22:07:30 +0000
Subject: Re: [PATCH 2/2] samples/bpf: test_cgrp2_sock2: fix an off by one
Message-Id: <20180716220728.gd6yq7yke7d7qijw@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713150301.gdvfu2ejlzlnglii@kili.mountain>
In-Reply-To: <20180713150301.gdvfu2ejlzlnglii@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2018 at 06:05:37PM +0300, Dan Carpenter wrote:
> "prog_cnt" is the number of elements which are filled out in prog_fd[]
> so the test should be >= instead of >.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

since this is sample code I've applied both patches to bpf-next tree.
Thanks

