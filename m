From: Moni Shoua <monis@mellanox.com>
Date: Mon, 13 Jun 2016 07:24:30 +0000
Subject: Re: [patch] IB/rxe: fix error code in rxe_srq_from_init()
Message-Id: <CAG9sBKN-XzPvhpFgxiBpB7FW6c0+PP7uF74zD4Had+368G9ViA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160613065341.GA5993@mwanda>
In-Reply-To: <20160613065341.GA5993@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma <linux-rdma@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 13, 2016 at 9:53 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If copy_to_user() fails then it returns the number of bytes not copied.
> It would be between 1-4 here.  Later the callers dereference it leading
> to an Oops.
>
> It was sort of hard to fix this without making the code confusing so I
> did a little cleanup.
>
> Fixes: 443c15d23220 ('IB/rxe: Shared Receive Queue (SRQ) manipulation functions')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan
I'll merge it to next series
