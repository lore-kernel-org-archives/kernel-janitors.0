From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Fri, 11 Mar 2016 09:59:02 +0000
Subject: Re: [RFC PATCH v0] Add tw5864 driver
Message-Id: <56E296E6.8000709@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451785302-3173-1-git-send-email-andrey.utkin@corp.bluecherry.net>
 <56938969.30104@xs4all.nl>
 <CAM_ZknVgTETBNXu+8N6eJa=cf_Mmj=+tA=ocKB9SJL5rkSyijQ@mail.gmail.com>
 <56B866D9.5070606@xs4all.nl> <20160309162924.6e6ebddf@zver>
 <56E27B12.1000803@xs4all.nl> <20160311104003.1cad89f3@zver>
In-Reply-To: <20160311104003.1cad89f3@zver>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: Linux Media <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-mentors@selenic.com" <kernel-mentors@selenic.com>, devel@driverdev.osuosl.org, kernel-janitors <kernel-janitors@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Andrey Utkin <andrey_utkin@fastmail.com>

On 03/11/2016 09:40 AM, Andrey Utkin wrote:
> On Fri, 11 Mar 2016 09:00:18 +0100
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> The reason is likely to be the tw5864_queue_setup function which has
>> not been updated to handle CREATE_BUFS support correctly. It should
>> look like this:
>>
>> static int tw5864_queue_setup(struct vb2_queue *q,
>> 			      unsigned int *num_buffers,
>> 			      unsigned int *num_planes, unsigned int
>> sizes[], void *alloc_ctxs[])
>> {
>> 	struct tw5864_input *dev = vb2_get_drv_priv(q);
>>
>> 	if (q->num_buffers + *num_buffers < 12)
>> 		*num_buffers = 12 - q->num_buffers;
>>
>> 	alloc_ctxs[0] = dev->alloc_ctx;
>> 	if (*num_planes)
>> 		return sizes[0] < H264_VLC_BUF_SIZE ? -EINVAL : 0;
>>
>> 	sizes[0] = H264_VLC_BUF_SIZE;
>> 	*num_planes = 1;
>>
>> 	return 0;
>> }
> 
> Thanks for suggestion, but now the failure looks this way:
> 
> Streaming ioctls:
>         test read/write: OK
>                 fail: v4l2-test-buffers.cpp(297): g_field() = V4L2_FIELD_ANY

While userspace may specify FIELD_ANY when setting a format, the driver should
always map that to a specific field setting and should never return FIELD_ANY
back to userspace.

In this case, the 'field' field of the v4l2_buffer struct has FIELD_ANY which
means it is not set correctly (or at all) in the driver.

It's a common mistake, which is why v4l2-compliance tests for it :-)

Regards,

	Hans

>                 fail: v4l2-test-buffers.cpp(703): buf.check(q, last_seq)
>                 fail: v4l2-test-buffers.cpp(976): captureBufs(node, q, m2m_q, frame_count, false)
>         test MMAP: FAIL
> 
> Will check that later. If you have any suggestions, I would be very
> grateful.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

