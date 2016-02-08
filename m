From: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Date: Mon, 08 Feb 2016 10:23:57 +0000
Subject: Re: [RFC PATCH v0] Add tw5864 driver
Message-Id: <CAM_ZknVjRo0vo2_SLmZSW7R_8LpNkmj-c3q1uBahEa_bSBK0hQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451785302-3173-1-git-send-email-andrey.utkin@corp.bluecherry.net>
	<56938969.30104@xs4all.nl>
	<CAM_ZknVgTETBNXu+8N6eJa=cf_Mmj=+tA=ocKB9SJL5rkSyijQ@mail.gmail.com>
	<56B866D9.5070606@xs4all.nl>
In-Reply-To: <56B866D9.5070606@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-mentors@selenic.com" <kernel-mentors@selenic.com>, devel@driverdev.osuosl.org, kernel-janitors <kernel-janitors@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Utkin <andrey.od.utkin@gmail.com>

On Mon, Feb 8, 2016 at 11:58 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> Hi Andrey,
>
> Hmm, it looks like I forgot to reply. Sorry about that.

Thank you very much anyway.

> I wouldn't change the memcpy: in my experience it is very useful to get a
> well-formed compressed stream out of the hardware. And the overhead of
> having to do a memcpy is a small price to pay and on modern CPUs should
> be barely noticeable for SDTV inputs.

So there's no usecase for scatter-gather approach, right?

> I don't believe that the lockups you see are related to the memcpy as
> such. The trace says that a cpu is stuck for 22s, no way that is related
> to something like that. It looks more like a deadlock somewhere.

There was a locking issue (lack of _irqsave) and was fixed since then.

> Regarding the compliance tests: don't pass VB2_USERPTR (doesn't work well
> with videobuf2-dma-contig). Also add vidioc_expbuf = vb2_ioctl_expbuf for
> the DMABUF support. That should clear up some of the errors you see.

Thank you!

-- 
Bluecherry developer.
