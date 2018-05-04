From: Borislav Petkov <bp@alien8.de>
Date: Fri, 04 May 2018 13:00:47 +0000
Subject: Re: [PATCH] EDAC: fix spelling mistake: "redundacy" -> "redundancy"
Message-Id: <20180504130047.GA9257@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180504113804.17103-1-colin.king@canonical.com>
In-Reply-To: <20180504113804.17103-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 04, 2018 at 12:38:04PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in err string
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/edac/i7core_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
> index 8c5540160a23..4d0ea3563d47 100644
> --- a/drivers/edac/i7core_edac.c
> +++ b/drivers/edac/i7core_edac.c
> @@ -1743,7 +1743,7 @@ static void i7core_mce_output_error(struct mem_ctl_info *mci,
>  		err = "write parity error";
>  		break;
>  	case 19:
> -		err = "redundacy loss";
> +		err = "redundancy loss";
>  		break;
>  	case 20:
>  		err = "reserved";
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
