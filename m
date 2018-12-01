From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 01 Dec 2018 20:36:14 +0000
Subject: Re: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <20181201203612.enqur2jkvexqqiue@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129102703.2huzlalirskjdl4k@kili.mountain>
 <20181130225801.7adzjdjkn5cirq4s@ast-mbp.dhcp.thefacebook.com>
 <20181201191341.GA4112@castle.DHCP.thefacebook.com>
 <20181201192844.qrdur3mdbcotyda4@ast-mbp.dhcp.thefacebook.com>
 <20181201201224.GA4803@castle.DHCP.thefacebook.com>
In-Reply-To: <20181201201224.GA4803@castle.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman Gushchin <guro@fb.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sat, Dec 01, 2018 at 08:12:34PM +0000, Roman Gushchin wrote:
> 
> From dc70ddb39c2f8d87d64b8d0fd71f4baa956d5f50 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Sat, 1 Dec 2018 10:39:44 -0800
> Subject: [PATCH v2 bpf] bpf: refactor bpf_test_run() to separate own failures
>  and test program result
> 
> After commit f42ee093be29 ("bpf/test_run: support cgroup local
> storage") the bpf_test_run() function may fail with -ENOMEM, if
> it's not possible to allocate memory for a cgroup local storage.
> 
> This error shouldn't be mixed with the return value of the testing
> program. Let's add an additional argument with a pointer where to
> store the testing program's result; and make bpf_test_run()
> return either 0 or -ENOMEM.
> 
> Fixes: f42ee093be29 ("bpf/test_run: support cgroup local storage")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Roman Gushchin <guro@fb.com>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Alexei Starovoitov <ast@kernel.org>

Applied to bpf tree. Thanks!
