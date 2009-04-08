From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:31:08 +0000
Subject: Re: [PATCH 29/56] irda: Remove void casts
Message-Id: <36ca99e90904080531p5167e7f6j12617436084fabfa@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
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
>  net/irda/discovery.c         |    4 ++--
>  net/irda/ircomm/ircomm_lmp.c |    2 +-
>  net/irda/iriap.c             |    2 +-
>  net/irda/irnet/irnet_irda.c  |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/net/irda/irnet/irnet_irda.c b/net/irda/irnet/irnet_irda.c
> index cf9a4b5..213f207 100644
> --- a/net/irda/irnet/irnet_irda.c
> +++ b/net/irda/irnet/irnet_irda.c
> @@ -766,7 +766,7 @@ irnet_find_socket(irnet_socket *    self)
>    * requested that nickname */
>   if(err = 0)
>     {
> -      new = (irnet_socket *) hashbin_find(irnet_server.list,
> +      new = hashbin_find(irnet_server.list,
>                                          0, self->rname);
Please check.

>       if(new)
>        DEBUG(IRDA_SERV_INFO, "Socket 0x%p matches rname ``%s''.\n",
> --
Bert
