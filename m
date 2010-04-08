From: Bart Van Assche <bvanassche@acm.org>
Date: Thu, 08 Apr 2010 15:07:02 +0000
Subject: Re: [patch] infiniband: checking the wrong variable
Message-Id: <r2le2e108261004080807i36ad0755gad9843224b0c42fc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407093901.GG5157@bicker>
	 <g2ge2e108261004080313t32c2e1besd8a95e2f9bf418f9@mail.gmail.com>
	 <ada7hoixaqw.fsf@roland-alpha.cisco.com>
In-Reply-To: <ada7hoixaqw.fsf-BjVyx320WGW9gfZ95n9DRSW4+XlvGpQz@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Apr 8, 2010 at 4:46 PM, Roland Dreier <rdreier@cisco.com> wrote:
>
> =A0> Have you already had the time to check whether this fix should be
> =A0> backported to already released kernels, and if so, to which kernel
> =A0> versions ? The easiest way to ask for backporting is to add "Cc:
> =A0> <stable@kernel.org>" in a patch.
>
> It backports but I don't see it as fixing a big enough problem to be
> worth it for stable.

It would be great if someone could explain the impact of this issue --
the impact is not yet clear to me.

Bart.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
