From: Nicolas Palix <Nicolas.Palix@inria.fr>
Date: Fri, 08 Oct 2010 07:59:47 +0000
Subject: Re: [patch] infiniband: uverbs: limit the number of entries
Message-Id: <AANLkTin5zou2JHsdDyhGESuxyPonOs3kLo9Th0vg-kd8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007071610.GC11681@bicker>
	<20101007161649.GD21206@obsidianresearch.com>
	<20101007165947.GD11681@bicker>
In-Reply-To: <20101007165947.GD11681@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

On Thu, Oct 7, 2010 at 6:59 PM, Dan Carpenter <error27@gmail.com> wrote:
> On Thu, Oct 07, 2010 at 10:16:49AM -0600, Jason Gunthorpe wrote:
>> On Thu, Oct 07, 2010 at 09:16:10AM +0200, Dan Carpenter wrote:
>> > If we don't limit cmd.ne then the multiplications can overflow. =A0This
>> > will allocate a small amount of RAM successfully for the "resp" and
>> > "wc" buffers. =A0The heap will get corrupted when we call ib_poll_cq().
>>
>> I think you could cap the number of returned entries to
>> UVERBS_MAX_NUM_ENTRIES rather than return EINVAL. That might be more
>> compatible with user space..
>>
>
> Good idea. =A0I don't actually have this hardware, so I can't test it, but
> that definitely sounds reasonable.
>
> If we did that then UVERBS_MAX_NUM_ENTRIES could be lower than 1000.
> What is a reasonable number?

You can also use kcalloc to allocate wc.

>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Nicolas Palix
Tel: +33 6 81 07 91 72
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
