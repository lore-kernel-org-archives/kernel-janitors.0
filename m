From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:05:54 +0000
Subject: Re: [PATCH 24/56] mips: Remove void casts
Message-Id: <49DDC882.3050701@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, ralf@linux-mips.org

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  arch/mips/boot/elf2ecoff.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/mips/boot/elf2ecoff.c b/arch/mips/boot/elf2ecoff.c
> index c5a7f30..0a4cbf0 100644
> --- a/arch/mips/boot/elf2ecoff.c
> +++ b/arch/mips/boot/elf2ecoff.c
> @@ -136,7 +136,7 @@ static char *saveRead(int file, off_t offset, off_t len, char *name)
>  		fprintf(stderr, "%s: fseek: %s\n", name, strerror(errno));
>  		exit(1);
>  	}
> -	if (!(tmp = (char *) malloc(len))) {
> +	if (!(tmp = malloc(len))) {
>  		fprintf(stderr, "%s: Can't allocate %ld bytes.\n", name,
>  			len);
>  		exit(1);
>   

