From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Tue, 24 Oct 2017 20:02:16 +0000
Subject: Re: [PATCH] IB/hfi1: Fix a wrapping test (make it less strict)
Message-Id: <20171024200216.GA15994@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013105559.tqzh6jhcnvmqhdwy@mwanda>
 <1508771116.3325.0.camel@redhat.com>
 <36cdf5bf-a28c-e853-523d-8cf0fa748a56@intel.com>
 <1508783626.3325.16.camel@redhat.com>
 <20171023190400.GA24412@obsidianresearch.com>
 <32E1700B9017364D9B60AED9960492BC3443EB1C@fmsmsx120.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC3443EB1C-RjuIdWtd+YbTXloPLtfHfbfspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Marciniszyn, Mike" <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dalessandro, Dennis" <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Oct 24, 2017 at 07:54:40PM +0000, Marciniszyn, Mike wrote:

> - Change to use Jason's test from above with UINT_MAX

UINT_MAX isn't U32_MAX, is it?

Jason
