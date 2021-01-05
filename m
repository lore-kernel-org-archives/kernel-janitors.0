From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 05 Jan 2021 14:19:58 +0000
Subject: Re: [PATCH] staging: vchiq: delete obselete comment
Message-Id: <CAK8P3a2dGXh8VOdiG38hbJH9oFFUTE8P4p+53yOnh=tw+JoD2g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/RnUjY3XkZohk7w@mwanda>
In-Reply-To: <X/RnUjY3XkZohk7w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: driverdevel <devel@driverdev.osuosl.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Amarjargal Gundjalam <amarjargal16@gmail.com>, Phil Elwell <phil@raspberrypi.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

On Tue, Jan 5, 2021 at 2:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This comment describes a security problem which was fixed in commit
> 1c954540c0eb ("staging: vchiq: avoid mixing kernel and user pointers").
> The bug is fixed now so the FIXME can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

There is still another sparse warning for a remaining __user address
space mismatch in the driver, but this one seems to be fixed as you
say. Thanks for the fix!

      Arnd
