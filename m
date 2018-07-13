From: David Ahern <dsahern@gmail.com>
Date: Fri, 13 Jul 2018 15:17:54 +0000
Subject: Re: [PATCH 2/2] samples/bpf: test_cgrp2_sock2: fix an off by one
Message-Id: <442e0225-9d07-f499-7f9d-768cd0b3d1e9@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713150301.gdvfu2ejlzlnglii@kili.mountain>
In-Reply-To: <20180713150301.gdvfu2ejlzlnglii@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/13/18 11:05 AM, Dan Carpenter wrote:
> "prog_cnt" is the number of elements which are filled out in prog_fd[]
> so the test should be >= instead of >.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Fixes: 554ae6e792ef3 ("samples/bpf: add userspace example for
prohibiting sockets")
Reviewed-by: David Ahern <dsahern@gmail.com>

Thanks for the fix.
