From: Neil Horman <nhorman@tuxdriver.com>
Date: Sun, 30 Jul 2006 21:34:57 +0000
Subject: Re: [KJ] patch to fix initialization code of edd.c
Message-Id: <20060730213457.GA32045@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
In-Reply-To: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 29, 2006 at 10:52:37PM -0700, Om. wrote:
> On 7/29/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> >On Sat, Jul 29, 2006 at 06:31:49PM -0700, Om. wrote:
> >> Hi,
> >> BIOS Enhanced Disk Drive Services (EDD) driver's failed return from
> >> the init function causes memory leaks in src/drivers/firmware/edd.c
> >> This is my first patch submission. It is generated against 2.6.18-rc2.
> >>
> >> Review comments welcome.
> >> Regards,
> >> Om.
> >>
> >Looks good, but instead of adding a stack variable failno to free the 
> >allocated
> >devices on failure, why not just use the same i variable and count 
> >backwards in
> >the loop under alloc_fail?
> I tried that first. But there would be some ambiguity between i=0 as a
> failure and i=0 as a success.
Ok, so remove the ambiguity from inside the for loop.  You have a few choices.
You can:

for (i=-1; i< edd_num_devices; ) {
....
i++;
edd_devices[i] = edev;

better still, right before you execute either of your goto's, just replace the
failno = i with a i--;, that way if you fail on the first iteration, i will
underflow to -1, and the freeing for loop will just get skipped.  And you save
an int worth of stack, which, while small, can be significant given that we're
building with single page stacks now.

thanks & regards
Neil

> What I meant is,
> 	int i;
> ...
> 	for (i = 0; i < edd_num_devices(); i++) {
> 		edev = kzalloc(sizeof (*edev), GFP_KERNEL);
> 		if (!edev) {
> 			rc = -ENOMEM;
> 			goto alloc_fail;
> 		}
> ....
> 		edd_devices[i] = edev;
> 	}
> ...
> alloc_fail:
> 	for (; i >= 0; i--) {
> 		edd_device_unregister (edd_devices[i]);
> 		kfree (edd_devices[i]);
> 	}
> ...
> Such code crash for the failure case of i=0. To avoid without another
> variable, I would have to resort to something like,
> 		if (!edev) {
> 			rc = -ENOMEM;
>                        /* keep a flag, modify the value of i ...etc
> to distinguish between success and failure*/
> 			goto alloc_fail;
> 		}
> which I thought ugly.
> 
> What is your opinion on this?
> Regards,
> Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
