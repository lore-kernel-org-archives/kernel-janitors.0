From: walter harms <wharms@bfs.de>
Date: Mon, 15 May 2017 10:21:45 +0000
Subject: Re: [PATCH 2/2] staging/atomisp: putting NULs in the wrong place
Message-Id: <59198139.9030405@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170515100135.guvreypnckqolnrq@mwanda>
In-Reply-To: <20170515100135.guvreypnckqolnrq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>, David Binderman <dcb314@hotmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org



Am 15.05.2017 12:01, schrieb Dan Carpenter:
> We're putting the NUL terminators one space beyond where they belong.
> This doesn't show up in testing because all but the callers put a NUL in
> the correct place themselves.  LOL.  It causes a static checker warning
> about buffer overflows.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/string_support.h b/drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/string_support.h
> index 74b5a1c7ac9a..c53241a7a281 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/string_support.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/string_support.h
> @@ -117,7 +117,7 @@ STORAGE_CLASS_INLINE int strncpy_s(
>  
>  	/* dest_str is big enough for the len */
>  	strncpy(dest_str, src_str, len);
> -	dest_str[len+1] = '\0';
> +	dest_str[len] = '\0';
>  	return 0;
>  }
>  
> @@ -157,7 +157,7 @@ STORAGE_CLASS_INLINE int strcpy_s(
>  
>  	/* dest_str is big enough for the len */
>  	strncpy(dest_str, src_str, len);
> -	dest_str[len+1] = '\0';
> +	dest_str[len] = '\0';
>  	return 0;
>  }
>  

can this strcpy_s() replaced with strlcpy ?

re,
 wh


> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
