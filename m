From: "Michal Nazarewicz" <mina86@mina86.com>
Date: Wed, 30 Nov 2011 13:08:29 +0000
Subject: Re: [PATCH] usb: gadget: f_mass_storage: common->curlun could be NULL
Message-Id: <op.v5rf4f163l0zgt@mpn-glaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1322600416.2182.48.camel@mars>
In-Reply-To: <1322600416.2182.48.camel@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 Nov 2011 22:00:16 +0100, Christoph Fritz <chf.fritz@googlemail.com> wrote:
> This patch adds a NULL check for common->curlun in case of an unknown_cmnd
> in do_scsi_command().

Did you actually encountered it? check_command() should set curlun, shouldn't it?

After calling check_command() curlun may be NULL only in two situations:
1. check_command() returned negative error code, or
2. we're dealing with INQUIRY or REQUEST_SENSE command.

In the first case, the line in question is not executed at all because of “if
(reply = 0)” check.

In the second case, we won't reach “unknown_cmnd” label because the two commands
have their own case labels and do not perform a goto.

So as far as I can see, common->curlun cannot be NULL in the place this patch
is fixing.

> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  drivers/usb/gadget/f_mass_storage.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/usb/gadget/f_mass_storage.c b/drivers/usb/gadget/f_mass_storage.c
> index c39d588..0e42027 100644
> --- a/drivers/usb/gadget/f_mass_storage.c
> +++ b/drivers/usb/gadget/f_mass_storage.c
> @@ -2184,7 +2184,8 @@ unknown_cmnd:
>  		reply = check_command(common, common->cmnd_size,
>  				      DATA_DIR_UNKNOWN, 0xff, 0, unknown);
>  		if (reply = 0) {
> -			common->curlun->sense_data = SS_INVALID_COMMAND;
> +			if (common->curlun)
> +				common->curlun->sense_data = SS_INVALID_COMMAND;
>  			reply = -EINVAL;
>  		}
>  		break;

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michał “mina86” Nazarewicz    (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
