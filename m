From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 16 Aug 2011 11:55:52 +0000
Subject: Re: [PATCH 3/4] drivers/media/video/hexium_gemini.c: delete useless
Message-Id: <20110816135552.655ef654@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312453774-23333-1-git-send-email-julia@diku.dk>
	<1312453774-23333-4-git-send-email-julia@diku.dk>
In-Reply-To: <1312453774-23333-4-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Thu,  4 Aug 2011 12:29:33 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Delete nontrivial initialization that is immediately overwritten by the
> result of an allocation function.
> (...)
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/media/video/hexium_gemini.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/drivers/media/video/hexium_gemini.c b/drivers/media/video/hexium_gemini.c
> --- a/drivers/media/video/hexium_gemini.c
> +++ b/drivers/media/video/hexium_gemini.c
> @@ -352,7 +352,7 @@ static struct saa7146_ext_vv vv_data;
>  /* this function only gets called when the probing was successful */
>  static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data *info)
>  {
> -	struct hexium *hexium = (struct hexium *) dev->ext_priv;
> +	struct hexium *hexium;
>  	int ret;
>  
>  	DEB_EE((".\n"));
> 

Looks correct.

Acked-by: Jean Delvare <khali@linux-fr.org>

-- 
Jean Delvare
