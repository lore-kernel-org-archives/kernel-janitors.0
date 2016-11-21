From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Mon, 21 Nov 2016 07:32:55 +0000
Subject: Re: [PATCH] stm class: Add a missing call to put_device
Message-Id: <87k2bxe194.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119182241.9030-1-lambert.quentin@gmail.com>
In-Reply-To: <20161119182241.9030-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Quentin Lambert <lambert.quentin@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quentin Lambert <lambert.quentin@gmail.com> writes:

> Most error branches following the call to class_find_device contain
> a call to put_device. This patch add calls to put_device where
> they are missing.
>
> This issue was found with Hector.
>
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
>
> ---
>  drivers/hwtracing/stm/core.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -368,8 +368,10 @@ static int stm_char_open(struct inode *i
>  		return -ENODEV;
> =20
>  	stmf =3D kzalloc(sizeof(*stmf), GFP_KERNEL);
> -	if (!stmf)
> +	if (!stmf) {
> +		put_device(dev);
>  		return -ENOMEM;
> +	}

There is a goto label at the bottom of this function which is supposed
 to deal with this. See the fix that we already have [1] for this issue.

[1] https://git.kernel.org/cgit/linux/kernel/git/ash/stm.git/commit/?h=3Dst=
m-for-greg-20161118&id=A0ebf519b8a2666438d999c62995618c710573e5

Regards,
--
alex
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
