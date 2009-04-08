From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 11:37:28 +0000
Subject: Re: [PATCH 18/56] isdn: Remove void casts
Message-Id: <36ca99e90904080437g55286754kd13b16ccc5139cb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:21, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/isdn/hardware/eicon/capifunc.c  |    2 +-
>  drivers/isdn/hardware/eicon/diddfunc.c  |    2 +-
>  drivers/isdn/hardware/eicon/divasfunc.c |    2 +-
>  drivers/isdn/hardware/eicon/divasi.c    |   27 ++++++++-------------------
>  drivers/isdn/hardware/eicon/idifunc.c   |    2 +-
>  drivers/isdn/hardware/eicon/mntfunc.c   |    2 +-
>  drivers/isdn/hardware/eicon/s_4bri.c    |    2 +-
>  drivers/isdn/hardware/eicon/um_idi.c    |    7 ++-----
>  8 files changed, 16 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/isdn/hardware/eicon/divasi.c b/drivers/isdn/hardware/eicon/divasi.c
> index 69e71eb..9021581 100644
> --- a/drivers/isdn/hardware/eicon/divasi.c
> +++ b/drivers/isdn/hardware/eicon/divasi.c
> @@ -238,8 +238,7 @@ um_idi_read(struct file *file, char __user *buf, size_t count, loff_t * offset)
>        }
>
>        if (!
> -           (p_os > -            (diva_um_idi_os_context_t *) diva_um_id_get_os_context(file->
> +           (p_os = diva_um_id_get_os_context(file->
>                                                                    private_data)))
Move this line up.

>        {
And this brace too (or remove the brace all together, because its one
line statement body).

>                return (-ENODEV);
> @@ -329,8 +328,7 @@ um_idi_write(struct file *file, const char __user *buf, size_t count,
>                        return (-ENODEV);
>        }
>
> -       if (!(p_os > -            (diva_um_idi_os_context_t *) diva_um_id_get_os_context(file->
> +       if (!(p_os = diva_um_id_get_os_context(file->
>                                                                    private_data)))
Dito.

>        {
Dito.

>                return (-ENODEV);

Bert
