From: Yann Droneaud <ydroneaud@opteya.com>
Date: Fri, 28 Mar 2014 10:27:48 +0000
Subject: Re: [patch] RDMA/cxgb4: info leak in c4iw_alloc_ucontext()
Message-Id: <1396002468.3297.63.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082428.GH25192@mwanda>
In-Reply-To: <20140328082428.GH25192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve Wise <swise@chelsio.com>, Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, roland@purestorage.com, dm@chelsio.com, leedom@chelsio.com, santosh@chelsio.com, kumaras@chelsio.com, nirranjan@chelsio.com, hariprasad@chelsio.com, Steve Wise <swise@opengridcomputing.com>

Hi,

Le vendredi 28 mars 2014 à 11:24 +0300, Dan Carpenter a écrit :
> The c4iw_alloc_ucontext_resp struct has a 4 byte hole after the last
> member and we should clear it before passing it to the user.
> 
> Fixes: 05eb23893c2c ('cxgb4/iw_cxgb4: Doorbell Drop Avoidance Bug Fixes')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

It's not the proper fix for this issue: an explicit padding has to be
added (and initialized), see "Re: [PATCH net-next 2/2] cxgb4/iw_cxgb4:
Doorbell Drop Avoidance Bug Fixes"
http://marc.info/?i95848977.3297.15.camel@localhost.localdomain

In its current form, the c4iw_alloc_ucontext_resp structure does not
require padding on i386, so a 32bits userspace program using this
structure against a x86_64 kernel will make the kernel do a buffer
overflow in userspace, likely on stack, as answer of a GET_CONTEXT
request:

#include <infiniband/verbs.h>
#include <infiniband/kern-abi.h>

#define IBV_INIT_CMD_RESP(cmd, size, opcode, out, outsize) \
do {                                                       \
    (cmd)->command = IB_USER_VERBS_CMD_##opcode;           \
    (cmd)->in_words  = (size) / 4;                         \
    (cmd)->out_words = (outsize) / 4;                      \
    (cmd)->response  = (out);                              \
} while (0)

struct c4iw_alloc_ucontext_resp {
        struct ibv_get_context_resp ibv_resp;
        __u64 status_page_key;
        __u32 status_page_size;
};

struct ibv_context *alloc_context(struct ibv_device *ibdev,
                                  int cmd_fd)
{
    struct ibv_get_context cmd;
    struct c4iw_alloc_ucontext_resp resp;
    ssize_t sret;
    ...

    IBV_INIT_CMD_RESP(&cmd, sizeof(cmd),
                      GET_CONTEXT,
                      &resp, sizeof(resp));
    ...
    sret = write(context->cmd_fd,
                 &cmd,
                 sizeof(cmd));

    if (sret != sizeof(cmd)) {
        int err = errno;
        fprintf(stderr, "GET_CONTEXT failed: %d (%s)\n",
                err, strerror(err));
        ...
    }
    ...
}

Unfortunately, it's not the only structure which has this problem. I'm
currently preparing a report on this issue for this driver (cxgb4) and
another.

> diff --git a/drivers/infiniband/hw/cxgb4/provider.c b/drivers/infiniband/hw/cxgb4/provider.c
> index e36d2a2..a72aaa7 100644
> --- a/drivers/infiniband/hw/cxgb4/provider.c
> +++ b/drivers/infiniband/hw/cxgb4/provider.c
> @@ -107,7 +107,7 @@ static struct ib_ucontext *c4iw_alloc_ucontext(struct ib_device *ibdev,
>  	struct c4iw_ucontext *context;
>  	struct c4iw_dev *rhp = to_c4iw_dev(ibdev);
>  	static int warned;
> -	struct c4iw_alloc_ucontext_resp uresp;
> +	struct c4iw_alloc_ucontext_resp uresp = {};
>  	int ret = 0;
>  	struct c4iw_mm_entry *mm = NULL;
>  

Regards.

-- 
Yann Droneaud
OPTEYA



