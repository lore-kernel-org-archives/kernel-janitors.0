From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 21 Sep 2004 22:03:14 +0000
Subject: Re: [Kernel-janitors] [PATCH] minmax-removal
Message-Id: <20040921220314.GF4260@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6230081886995591=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============6230081886995591==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 15 Aug 2004, Michael Veeck wrote:

> Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
> calls to use kernel.h macros instead.
> 
> Since I dont have the hardware those patches are not tested.
> 
> Best regards
> Veeck
> 
> Signed-off-by: Michael Veeck <michael.veeck@gmx.net>
> 
> 
> 
> 

> --- linux-2.6.8-old/arch/um/drivers/mconsole_user.c	2004-08-14 11:48:56.000000000 +0200
> +++ linux-2.6.8-new/arch/um/drivers/mconsole_user.c	2004-08-15 12:50:48.610087432 +0200
> @@ -67,8 +67,6 @@ static struct mconsole_command *mconsole
>  	return(NULL);
>  }
>  
> -#define MIN(a,b) ((a)<(b) ? (a):(b))
> -
>  #define STRINGX(x) #x
>  #define STRING(x) STRINGX(x)
>  
> @@ -86,7 +84,7 @@ int mconsole_get_request(int fd, struct 
>  
>  	if(req->request.magic != MCONSOLE_MAGIC){
>  		/* Unversioned request */
> -		len = MIN(sizeof(req->request.data) - 1, 
> +		len = min_t(int, sizeof(req->request.data) - 1, 
>  			  strlen((char *) &req->request));
>  		memmove(req->request.data, &req->request, len);
>  		req->request.data[len] = '\0';
> @@ -131,7 +129,7 @@ int mconsole_reply(struct mc_request *re
>  		/* err can only be true on the first packet */
>  		err = 0;
>  
> -		len = MIN(total, MCONSOLE_MAX_DATA - 1);
> +		len = min(total, MCONSOLE_MAX_DATA - 1);
>  
>  		if(len == total) reply.more = more;
>  		else reply.more = 1;

no idea why that file is in the kernel,
it's a userspace programm dropping this patch.

a++ maks


--===============6230081886995591==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6230081886995591==--
