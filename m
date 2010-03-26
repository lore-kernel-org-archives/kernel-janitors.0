From: Henrik Kretzschmar <henne@nachtwindheim.de>
Date: Fri, 26 Mar 2010 11:17:20 +0000
Subject: Re: [PATCH] mkpiggy.c fixes compiler warning
Message-Id: <4BAC97C0.9050604@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268591308.6104.6.camel@lovely>
In-Reply-To: <1268591308.6104.6.camel@lovely>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Christoph Fritz schrieb:
> fixes compiler warning (ignoring return value of 'fread', declared with
> attribute warn_unused_result) and fseek error returns now
>
>
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  arch/x86/boot/compressed/mkpiggy.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/mkpiggy.c b/arch/x86/boot/compressed/mkpiggy.c
> index bcbd36c..78d14d2 100644
> --- a/arch/x86/boot/compressed/mkpiggy.c
> +++ b/arch/x86/boot/compressed/mkpiggy.c
> @@ -61,8 +61,12 @@ int main(int argc, char *argv[])
>  
>  	if (fseek(f, -4L, SEEK_END)) {
>  		perror(argv[1]);
> +		return 1;
> +	}
> +	if (fread(&olen, sizeof olen, 1, f) != 1) {
> +		perror(argv[1]);
> +		return 1;
>  	}
> -	fread(&olen, sizeof olen, 1, f);
>  	ilen = ftell(f);
>  	olen = getle32(&olen);
>  	fclose(f);
>   
Hi Christoph,

this looks good to me, so you can add a:

Acked-by: Henrik Kretzschmar <henne@nachtwindheim.de>


Now you have to send it to the responsible maintainer(s).
Take a look at MAINTAINERS or better use ./scripts/get_maintainer.pl --roles -f <your patchfile> .

Greets,
Henrik

