From: Joe Stringer <joe@wand.net.nz>
Date: Thu, 11 Oct 2018 17:01:27 +0000
Subject: Re: [bug report] bpf: Add helper to retrieve socket in BPF
Message-Id: <CAOftzPiz21QH1Qkxm_WQiS6RE+L1mbkK8=oEqjYntsLQM4_bCw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181011115426.GA21551@mwanda>
In-Reply-To: <20181011115426.GA21551@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 11 Oct 2018 at 06:47, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Joe Stringer,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 6acc9b432e67: "bpf: Add helper to retrieve socket in BPF"
> from Oct 2, 2018, leads to the following Smatch complaint:
>
>     net/core/filter.c:4893 bpf_sk_lookup()
>     error: we previously assumed 'skb->dev' could be null (see line 4885)

Thanks for the report Dan, I'm working on a fix.
