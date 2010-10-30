From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sat, 30 Oct 2010 14:33:25 +0000
Subject: Re: [PATCH] net: core: scm: fix information leak to userland
Message-Id: <1288449205.2680.968.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448796-6147-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448796-6147-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, Tejun Heo <tj@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Le samedi 30 octobre 2010 à 18:26 +0400, Vasiliy Kulikov a écrit :
> Structure cmsghdr is copied to userland with padding bytes
> unitialized on architectures where __kernel_size_t is unsigned long.
> It leads to leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  net/core/scm.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 413cab8..a4a9b70 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -233,6 +233,7 @@ int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
>  		msg->msg_flags |= MSG_CTRUNC;
>  		cmlen = msg->msg_controllen;
>  	}
> +	memset(&cmhdr, 0, sizeof(cmhdr));
>  	cmhdr.cmsg_level = level;
>  	cmhdr.cmsg_type = type;
>  	cmhdr.cmsg_len = cmlen;


???

struct cmsghdr {
        __kernel_size_t cmsg_len;       /* data byte count, including hdr */
        int             cmsg_level;     /* originating protocol */
        int             cmsg_type;      /* protocol-specific type */
};

Could you explain where are the padding bytes ?



