From: "Hefty, Sean" <sean.hefty@intel.com>
Date: Thu, 11 Nov 2010 00:39:20 +0000
Subject: RE: [PATCH] infiniband: core: fix information leak to userland
Message-Id: <CF9C39F99A89134C9CF9C4CCB68B8DDF25B84C5C8D@orsmsx501.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289054481-18145-1-git-send-email-segooon@gmail.com>
 <ada39r8ohiz.fsf@cisco.com>
In-Reply-To: <ada39r8ohiz.fsf-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Vasiliy Kulikov <segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Chiang <achiang-VXdhtT5mjnY@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> Sean, what is intended for qp_state handling here?  It seems
> ib_copy_qp_attr_to_user() should either clear it or set it to something
> sensible.

I'm not sure what the original intent was, but both libibcm and librdmacm provide the qp_state as input to the init_qp_attr calls.  It doesn't end up mattering if the kernel returns the value because the corresponding call in libibverbs (ibv_copy_qp_attr_from_kern) doesn't copy out the qp_state.  So, the value that was originally specified ends up being used.  The flow looks something like this:

qp_attr.qp_state = INIT;
cmd.qp_state = qp_attr.qp_state;
write(..cmd..);
ibv_copy_qp_attr_from_kern(&qp_attr, cmd.resp)

I agree that it makes sense for ib_copy_qp_attr_to_user() to set the qp_state.  Deciding what to do in libibverbs seems more troublesome.

- Sean
