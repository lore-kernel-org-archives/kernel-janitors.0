From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 09 Nov 2016 22:43:34 +0000
Subject: Re: [bug report] genetlink: fix error return code in genl_register_family()
Message-Id: <CAM_iQpXySa6i6_Gtue1gbaHGZq5DG6SMvdO=ufGousUDKCGocw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161109095613.GA24471@mwanda>
In-Reply-To: <20161109095613.GA24471@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: weiyongjun1@huawei.com, kernel-janitors@vger.kernel.org, Linux Kernel Network Developers <netdev@vger.kernel.org>

Cc'ing netdev

On Wed, Nov 9, 2016 at 1:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Wei Yongjun,
>
> The patch 22ca904ad70a: "genetlink: fix error return code in
> genl_register_family()" from Nov 1, 2016, leads to the following
> static checker warning:
>
>         net/netlink/genetlink.c:365 genl_register_family()
>         warn: unsigned 'family->id' is never less than zero.
>
> net/netlink/genetlink.c
>    362
>    363          family->id = idr_alloc(&genl_fam_idr, family,
>    364                                 start, end + 1, GFP_KERNEL);
>    365          if (family->id < 0) {
>                     ^^^^^^^^^^^^^^
> Doesn't work for unsigned int.


family->id should be signed int.
