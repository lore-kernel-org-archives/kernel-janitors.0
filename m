From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 19:43:00 +0000
Subject: Re: [PATCH] soc: fsl: qe: gpio: Fix an error code in qe_pin_request()
Message-Id: <20190503194300.GG2269@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131551.GB1236@mwanda>
 <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
In-Reply-To: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kernel-janitors@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>

On Fri, May 03, 2019 at 01:45:07PM -0500, Li Yang wrote:
> On Fri, May 3, 2019 at 8:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > There was a missing error code in this path.  It meant that we returned
> > ERR_PTR(0) which is NULL and would result in a NULL dereference in the
> > caller.
> 
> Thanks Dan.  An early version of this patch has been included in a
> pending pull request to arm-soc.
> https://lkml.org/lkml/2019/5/1/506

Oops.  Sorry, I switched computers and forgot to copy my old outbox
over.  :(

regards,
dan carpenter
