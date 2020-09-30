From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 30 Sep 2020 10:22:37 +0000
Subject: Re: [PATCH] staging: vchiq: silence an uninitialized variable warning
Message-Id: <CAK8P3a1m3kaGK17A2ADgA7b9i7GeEYhX=xVoU=Yet8_T93Q2JA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200930090238.GA621698@mwanda>
In-Reply-To: <20200930090238.GA621698@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, driverdevel <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Jamal Shareef <jamal.k.shareef@gmail.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

On Wed, Sep 30, 2020 at 11:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
> without being initialized.  Smatch is correct, however, in that
> situation the "userdata" is not used so it doesn't cause a problem.
> Passing an uninitialized variable will trigger a UBSan warning at
> runtime so this warning is worth silencing by setting "userdata" to
> NULL.
>
> Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The change looks fine, but I wonder if it's actually worse and the
uninitialized pointer can end up getting copied back to user space
in the completion.

In either case, thanks for the fix!

Acked-by: Arnd Bergmann <arnd@arndb.de>
