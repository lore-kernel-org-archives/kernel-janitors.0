From: Dan Carpenter <error27@gmail.com>
Date: Wed, 06 Oct 2010 04:44:00 +0000
Subject: Re: [PATCH 10/28] Staging: comedi: kcomedilib: kcomedilib_main.c:
Message-Id: <20101006044400.GB5409@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com> <1286326843-6170-10-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-10-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tracey Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 05, 2010 at 09:00:25PM -0400, Tracey Dent wrote:
> @@ -50,7 +50,7 @@ struct comedi_device *comedi_open(const char *filename)
>  	if (strncmp(filename, "/dev/comedi", 11) != 0)
>  		return NULL;
>  
> -	minor = simple_strtoul(filename + 11, NULL, 0);
> +	minor = strict_strtoul(filename + 11, NULL, 0);
>  

No, this doesn't work.  strict_strtoul() only returns zero and -EINVAL.
It doesn't return the number.

GCC even warns about this change:
drivers/staging/comedi/kcomedilib/kcomedilib_main.c: In function ‘comedi_open’:
drivers/staging/comedi/kcomedilib/kcomedilib_main.c:53: warning:
passing argument 2 of ‘strict_strtoul’ makes integer from pointer without a cast

Please at least compile these before sending.  :(

>  	if (minor >= COMEDI_NUM_BOARD_MINORS)
>  		return NULL;

regards,
dan carpenter
