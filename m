From: Peter Chen <hzpeterchen@gmail.com>
Date: Mon, 18 Nov 2019 09:09:39 +0000
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
Message-Id: <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030034046.188808-1-weiyongjun1@huawei.com> <20191030081101.GF26815@b29397-desktop>
In-Reply-To: <20191030081101.GF26815@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

BR,
Peter Chen

On Wed, Oct 30, 2019 at 4:12 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 19-10-30 03:40:46, Wei Yongjun wrote:
> > The driver allocates the spinlock but not initialize it.
> > Use spin_lock_init() on it to initialize it correctly.
> >
> > This is detected by Coccinelle semantic patch.
> >
> > Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/usb/gadget/configfs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > index 33852c2b29d1..ab9ac48a751a 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
> >       gi->composite.resume = NULL;
> >       gi->composite.max_speed = USB_SPEED_SUPER;
> >
> > +     spin_lock_init(&gi->spinlock);
> >       mutex_init(&gi->lock);
> >       INIT_LIST_HEAD(&gi->string_list);
> >       INIT_LIST_HEAD(&gi->available_func);
> >
>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>

Hi Felipe & Greg,

We may need this patch for usb/next and usb/linus tree, otherwise, there will
be kernel dump if enable lockdep:

mount: /sys/kernel/config: none already mounted or mount point busy.
[   77.368029] Mass Storage Function, version: 2009/09/11
[   77.373485] LUN: removable file: (no medium)
[   77.483545] INFO: trying to register non-static key.
[   77.488532] the code is fine but needs lockdep annotation.
[   77.494020] turning off the locking correctness validator.
[   77.499516] CPU: 0 PID: 497 Comm: sh Not tainted
5.4.0-rc6-00127-g65ce4f17e132 #132
[   77.507174] Hardware name: Freescale i.MX6 SoloLite (Device Tree)
[   77.513295] [<c0112b00>] (unwind_backtrace) from [<c010ccf8>]
(show_stack+0x10/0x14)
[   77.521055] [<c010ccf8>] (show_stack) from [<c0c47654>]
(dump_stack+0xd4/0x108)
[   77.528380] [<c0c47654>] (dump_stack) from [<c0184eb4>]
(register_lock_class+0x6a0/0x724)
[   77.536567] [<c0184eb4>] (register_lock_class) from [<c0182aa4>]
(__lock_acquire+0x58/0x10dc)
[   77.545099] [<c0182aa4>] (__lock_acquire) from [<c01843b0>]
(lock_acquire+0xd4/0x1f4)
[   77.552939] [<c01843b0>] (lock_acquire) from [<c0c6aac0>]
(_raw_spin_lock_irqsave+0x38/0x4c)
[   77.561413] [<c0c6aac0>] (_raw_spin_lock_irqsave) from [<bf01c8ec>]
(configfs_composite_disconnect+0x20/0x64 [libco
mposite])
[   77.572668] [<bf01c8ec>] (configfs_composite_disconnect
[libcomposite]) from [<c0810ad0>] (usb_gadget_disconnect+0x
13c/0x184)
[   77.583985] [<c0810ad0>] (usb_gadget_disconnect) from [<c080a9d0>]
(ci_udc_start+0x74/0x94)
[   77.592344] [<c080a9d0>] (ci_udc_start) from [<c08111c8>]
(udc_bind_to_driver+0x98/0x100)
[   77.600528] [<c08111c8>] (udc_bind_to_driver) from [<c081164c>]
(usb_gadget_probe_driver+0xfc/0x14c)
[   77.609690] [<c081164c>] (usb_gadget_probe_driver) from
[<bf01d55c>] (gadget_dev_desc_UDC_store+0xb4/0xcc [libcompo
site])
[   77.620692] [<bf01d55c>] (gadget_dev_desc_UDC_store [libcomposite])
from [<bf00d730>] (configfs_write_file+0x10c/0x
1b4 [configfs])
[   77.632457] [<bf00d730>] (configfs_write_file [configfs]) from
[<c0291da0>] (__vfs_write+0x28/0x1c4)
[   77.641601] [<c0291da0>] (__vfs_write) from [<c02944bc>]
(vfs_write+0xa0/0x180)
[   77.648919] [<c02944bc>] (vfs_write) from [<c0294704>] (ksys_write+0x54/0xcc)
[   77.656064] [<c0294704>] (ksys_write) from [<c0101000>]
(ret_fast_syscall+0x0/0x28)
[   77.663723] Exception stack(0xecafffa8 to 0xecaffff0)
[   77.668781] ffa0:                   0000000a 00256330 00000001
00256330 0000000a 00000000
[   77.676964] ffc0: 0000000a 00256330 b6e9ada8 00000004 0000000a
0000000a 00000000 00000000
[   77.685145] ffe0: 00000444 bef0b9d0 b6dc7a18 b6e1f6cc

Peter
