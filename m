From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:02:48 +0000
Subject: Re: [PATCH 51/56] sysv: Remove void casts
Message-Id: <36ca99e90904080502w1a9d703dg49a872b5539c3a9f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:22, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/sysv/dir.c |   14 +++++++-------
>  1 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/fs/sysv/dir.c b/fs/sysv/dir.c
> index 56f6552..8a9f5a7 100644
> --- a/fs/sysv/dir.c
> +++ b/fs/sysv/dir.c
> @@ -367,7 +367,7 @@ struct sysv_dir_entry * sysv_dotdot (struct inode *dir, struct page **p)
>        struct sysv_dir_entry *de = NULL;
>
>        if (!IS_ERR(page)) {
> -               de = (struct sysv_dir_entry*) page_address(page) + 1;
> +               de = page_address(page) + 1;
This is probably wrong, because (void* + 1) != (struct sysv_dir_entry* + 1).

>                *p = page;
>        }
>        return de;
> --

Bert
