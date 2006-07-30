From: "Om." <om.turyx@gmail.com>
Date: Sun, 30 Jul 2006 22:39:12 +0000
Subject: Re: [KJ] patch to fix initialization code of edd.c
Message-Id: <6b4e42d10607301539o2088662dxcbc145342b7ebcc2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
In-Reply-To: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/30/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> On Sat, Jul 29, 2006 at 10:52:37PM -0700, Om. wrote:
> > On 7/29/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> > >On Sat, Jul 29, 2006 at 06:31:49PM -0700, Om. wrote:
> > >> Hi,
> > >> BIOS Enhanced Disk Drive Services (EDD) driver's failed return from
> > >> the init function causes memory leaks in src/drivers/firmware/edd.c
> > >> This is my first patch submission. It is generated against 2.6.18-rc2.
> > >>
> > >> Review comments welcome.
> > >> Regards,
> > >> Om.
> > >>
> > >Looks good, but instead of adding a stack variable failno to free the
> > >allocated
> > >devices on failure, why not just use the same i variable and count
> > >backwards in
> > >the loop under alloc_fail?
> > I tried that first. But there would be some ambiguity between i=0 as a
> > failure and i=0 as a success.
> Ok, so remove the ambiguity from inside the for loop.  You have a few choices.
> You can:
>
> for (i=-1; i< edd_num_devices; ) {
> ....
> i++;
> edd_devices[i] = edev;
>
> better still, right before you execute either of your goto's, just replace the
> failno = i with a i--;, that way if you fail on the first iteration, i will
> underflow to -1, and the freeing for loop will just get skipped.  And you save
> an int worth of stack, which, while small, can be significant given that we're
> building with single page stacks now.
Yeah.. Jaco Kroon suggested something on the same line and I
implemented it. I have already sent it, but I think it went out of
thread because I added [3rd try] to the subject line.

From now on, I would not modify the subject line in threads.

Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
