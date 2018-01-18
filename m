From: Daniel Borkmann <daniel@iogearbox.net>
Date: Thu, 18 Jan 2018 21:23:34 +0000
Subject: Re: [PATCH v2] tools/bpftool: silence a static checker warning
Message-Id: <32647e96-1fd5-72c6-8d3d-9980acab1c97@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118093521.GA19707@mwanda>
In-Reply-To: <20180118093521.GA19707@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/18/2018 10:35 AM, Dan Carpenter wrote:
> There is a static checker warning that "proglen" has an upper bound but
> no lower bound.  The allocation will just fail harmlessly so it's not a
> big deal.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to bpf-next, thanks Dan! (I changed the prefix from 'tools/bpftool'
into 'tools/bpf_jit_disasm' since it's not touching bpftool here.)
