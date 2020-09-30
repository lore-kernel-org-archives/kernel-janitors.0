From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Sep 2020 12:27:41 +0000
Subject: Re: [PATCH] staging: vchiq: silence an uninitialized variable warning
Message-Id: <20200930122741.GB4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200930090238.GA621698@mwanda>
 <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
In-Reply-To: <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: driverdevel <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Jamal Shareef <jamal.k.shareef@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 30, 2020 at 12:22:37PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 30, 2020 at 11:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
> > without being initialized.  Smatch is correct, however, in that
> > situation the "userdata" is not used so it doesn't cause a problem.
> > Passing an uninitialized variable will trigger a UBSan warning at
> > runtime so this warning is worth silencing by setting "userdata" to
> > NULL.
> >
> > Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> The change looks fine, but I wonder if it's actually worse and the
> uninitialized pointer can end up getting copied back to user space
> in the completion.

Ah... Wow.  You're right.  I think I really need to resend this with a
more accurate commit message.

regards,
dan carpenter
