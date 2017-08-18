From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 18 Aug 2017 08:21:16 +0000
Subject: Re: [PATCH net-next] bpf: fix a return in sockmap_get_from_fd()
Message-Id: <5996A37C.2050502@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818071210.wyq37kura6wz6bx6@mwanda>
In-Reply-To: <20170818071210.wyq37kura6wz6bx6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/18/2017 09:27 AM, Dan Carpenter wrote:
> "map" is a valid pointer.  We wanted to return "err" instead.  Also
> let's return a zero literal at the end.
>
> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
