From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Wed, 10 Dec 2008 22:48:54 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <20081210224854.GA5167@zarina>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk> <20081210163819.17cf4628@lxorguk.ukuu.org.uk> <45755.88.114.236.15.1228932236.squirrel@webmail.movial.fi> <20081210212659.GA6132@zarina> <42393.88.114.236.15.1228946794.squirrel@webmail.movial.fi>
In-Reply-To: <42393.88.114.236.15.1228946794.squirrel@webmail.movial.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vorobiev Dmitri <dmitri.vorobiev@movial.fi>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

On Thu, Dec 11, 2008 at 12:06:34AM +0200, Vorobiev Dmitri wrote:
> > On Wed, Dec 10, 2008 at 08:03:56PM +0200, Vorobiev Dmitri wrote:
> >> > On Wed, 10 Dec 2008 17:26:26 +0100 (CET)
> >> > Julia Lawall <julia@diku.dk> wrote:
> >> >
> >> >> From: Julia Lawall <julia@diku.dk>
> >> >>
> >> >> The return value of the remove function of a driver structure, and
> >> thus
> >> >> of
> >> >> a platform_driver structure, is ultimately ignored
> >> >
> >> > Currently
> >>
> >> Are there really any plans about actually using the return value?
> >
> > It's often used by the drivers, but currently not handled by
> > the subsystem. For example, _remove() callback might return -EBUSY
> > or -EAGAIN, which means that whoever called the _remove() should
> > try later.
> 
> Sure, it's easy to find drivers, which that return a non-dummy value from
> the remove() callback thinking that someone up there will take care of the
> error.
> 
> The point is, however, that
[...]
> SCSI maintainers do not apply the patch

This sometimes happens. You can try to repost your original patch, and
in the commit message briefly describe that return type is unlikely to
change, and give a pointer to this discussion.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
