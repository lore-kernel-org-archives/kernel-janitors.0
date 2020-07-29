From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Jul 2020 18:36:32 +0000
Subject: Re: [PATCH] net/mlx5e: fix bpf_prog reference count leaks in mlx5e_alloc_rq
Message-Id: <810e5783-ba95-6d2f-0f89-171dd3b688df@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Xin Xiong <xiongx18@fudan.edu.cn>, Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>, bpf@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Leon Romanovsky <leon@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Saeed Mahameed <saeedm@mellanox.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Yuan Zhang <yuanxzhang@fudan.edu.cn>

…
> The refcount leak issues take place in two error handling paths.

Can an other wording be a bit nicer for the commit message?


> Fix the issue by …

I suggest to replace this wording by the tag “Fixes”.

Regards,
Markus
