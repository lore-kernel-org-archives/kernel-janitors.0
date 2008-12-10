From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Wed, 10 Dec 2008 21:26:59 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <20081210212659.GA6132@zarina>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk> <20081210163819.17cf4628@lxorguk.ukuu.org.uk> <45755.88.114.236.15.1228932236.squirrel@webmail.movial.fi>
In-Reply-To: <45755.88.114.236.15.1228932236.squirrel@webmail.movial.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vorobiev Dmitri <dmitri.vorobiev@movial.fi>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 10, 2008 at 08:03:56PM +0200, Vorobiev Dmitri wrote:
> > On Wed, 10 Dec 2008 17:26:26 +0100 (CET)
> > Julia Lawall <julia@diku.dk> wrote:
> >
> >> From: Julia Lawall <julia@diku.dk>
> >>
> >> The return value of the remove function of a driver structure, and thus
> >> of
> >> a platform_driver structure, is ultimately ignored
> >
> > Currently
> 
> Are there really any plans about actually using the return value?

It's often used by the drivers, but currently not handled by
the subsystem. For example, _remove() callback might return -EBUSY
or -EAGAIN, which means that whoever called the _remove() should
try later.

For example see drivers/mfd/asic3.c. The driver registers GPIO
chips, on _remove() it *tries* to unregister these chips, but
it could fail (when provided GPIOs are in use by somebody -- it
might be in-kernel users, or sysfs users).

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
