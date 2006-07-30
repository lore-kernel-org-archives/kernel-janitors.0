From: "Om." <om.turyx@gmail.com>
Date: Sun, 30 Jul 2006 05:52:37 +0000
Subject: Re: [KJ] patch to fix initialization code of edd.c
Message-Id: <6b4e42d10607292252s7b06bc7fk45f72b3be65ff677@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
In-Reply-To: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/29/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> On Sat, Jul 29, 2006 at 06:31:49PM -0700, Om. wrote:
> > Hi,
> > BIOS Enhanced Disk Drive Services (EDD) driver's failed return from
> > the init function causes memory leaks in src/drivers/firmware/edd.c
> > This is my first patch submission. It is generated against 2.6.18-rc2.
> >
> > Review comments welcome.
> > Regards,
> > Om.
> >
> Looks good, but instead of adding a stack variable failno to free the allocated
> devices on failure, why not just use the same i variable and count backwards in
> the loop under alloc_fail?
I tried that first. But there would be some ambiguity between i=0 as a
failure and i=0 as a success.
What I meant is,
	int i;
...
	for (i = 0; i < edd_num_devices(); i++) {
		edev = kzalloc(sizeof (*edev), GFP_KERNEL);
		if (!edev) {
			rc = -ENOMEM;
			goto alloc_fail;
		}
....
		edd_devices[i] = edev;
	}
...
alloc_fail:
	for (; i >= 0; i--) {
		edd_device_unregister (edd_devices[i]);
		kfree (edd_devices[i]);
	}
...
Such code crash for the failure case of i=0. To avoid without another
variable, I would have to resort to something like,
		if (!edev) {
			rc = -ENOMEM;
                        /* keep a flag, modify the value of i ...etc
to distinguish between success and failure*/
			goto alloc_fail;
		}
which I thought ugly.

What is your opinion on this?
Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
