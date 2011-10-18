From: Roland Dreier <roland@kernel.org>
Date: Tue, 18 Oct 2011 17:10:42 +0000
Subject: Re: [patch] RDMA/nes: silence compiler warning
Message-Id: <CAL1RGDX5EGxqatX-RFLKqZcJ+pYDHhie3G04rD=BedA9uBvA6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017072857.GB7812@elgon.mountain> <CAL1RGDVe7OKL35G9hdzYNWGZkC+g_HXXXrkRgw2ueTk__vMNPg@mail.gmail.com>
 <2EFBCAEF10980645BBCFB605689E08E904EC56F5E0@azsmsx506.amr.corp.intel.com>
In-Reply-To: <2EFBCAEF10980645BBCFB605689E08E904EC56F5E0-uLM7Qlg6MbdZtRGVdHMbwrfspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Latif, Faisal" <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Oct 17, 2011 at 11:28 AM, Latif, Faisal <faisal.latif@intel.com> wrote:
> Yes, We should have used %pI4 for this also.

Any chance of you guys going through and converting IP printing to
%pI4 in the whole driver?

 - R.
