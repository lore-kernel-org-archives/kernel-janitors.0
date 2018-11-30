From: Song Liu <liu.song.a23@gmail.com>
Date: Fri, 30 Nov 2018 22:54:06 +0000
Subject: Re: [PATCH net] bpf: uninitialized variables in test code
Message-Id: <CAPhsuW4MGweXFyngYRmTu4ZT4KsvGb57T3sXqTGRHgAcbWqbCQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129102703.2huzlalirskjdl4k@kili.mountain>
In-Reply-To: <20181129102703.2huzlalirskjdl4k@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S . Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 29, 2018 at 2:28 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that if bpf_test_run() fails with -ENOMEM at the
> begining then the "duration" is uninitialized.  We then copy the
> unintialized variables to the user inside the bpf_test_finish()
> function.  The functions require CAP_SYS_ADMIN so it's not really an
> information leak.
>
> Fixes: 1cf1cae963c2 ("bpf: introduce BPF_PROG_TEST_RUN command")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  net/bpf/test_run.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index c89c22c49015..49304192a031 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -114,7 +114,7 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
>         bool is_l2 = false, is_direct_pkt_access = false;
>         u32 size = kattr->test.data_size_in;
>         u32 repeat = kattr->test.repeat;
> -       u32 retval, duration;
> +       u32 retval, duration = 0;
>         int hh_len = ETH_HLEN;
>         struct sk_buff *skb;
>         struct sock *sk;
> @@ -196,7 +196,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
>         u32 repeat = kattr->test.repeat;
>         struct netdev_rx_queue *rxqueue;
>         struct xdp_buff xdp = {};
> -       u32 retval, duration;
> +       u32 retval, duration = 0;
>         void *data;
>         int ret;
>
> --
> 2.11.0
>
