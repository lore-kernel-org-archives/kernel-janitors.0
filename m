From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Mon, 22 Oct 2012 09:34:24 +0000
Subject: Re: [remoteproc:for-next 7/12] ERROR: "vring_del_virtqueue" [drivers/remoteproc/remoteproc.ko] undef
Message-Id: <CAK=WgbZBjcOKWP8qtKVd+iecYb0-JL5oWZfCqoq0Kz8PPWF52Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121006080758.GB29618@localhost> <CAK=WgbaBxyxzqxb6S98BdPTovS-SKueJBY+7JRqkX+GoQj=w9g@mail.gmail.com>
In-Reply-To: <CAK=WgbaBxyxzqxb6S98BdPTovS-SKueJBY+7JRqkX+GoQj=w9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: =?ISO-8859-1?Q?Sjur_Br=E6ndeland?= <sjur.brandeland@stericsson.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Fengguang,

On Sat, Oct 6, 2012 at 11:57 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> On Sat, Oct 6, 2012 at 10:07 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> ERROR: "vring_del_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
>> ERROR: "register_virtio_device" [drivers/remoteproc/remoteproc.ko] undefined!
>> ERROR: "unregister_virtio_device" [drivers/remoteproc/remoteproc.ko] undefined!
>> ERROR: "vring_new_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
>> ERROR: "vring_interrupt" [drivers/remoteproc/remoteproc.ko] undefined!
>> ERROR: "vring_transport_features" [drivers/remoteproc/remoteproc.ko] undefined!
>
> Thanks, Fengguang, I've pushed this patch to fix this:
...
> +       select VIRTIO_RING

Do you still see these issues with 3.7-rc2 ?

Rusty eliminated CONFIG_VIRTIO_RING recently, which makes this patch redundant.

I'm dropping this for now, please tell me if you still see any issue.

Thanks,
Ohad.
