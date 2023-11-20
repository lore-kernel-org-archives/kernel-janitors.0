Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82817125A5
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KxELYPko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE3EC433CA;
	Mon, 20 Nov 2023 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700474537;
	bh=lytuxTkPB0okNqk+8s8bs37ZXG5dyB+2G+cEs+pRKrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxELYPkozyB8TtUxqn6hWTyg2QO+i8CSsK/BaMsBOQDfYQrwrWJ6718zFPrgXDgIc
	 ROV5K/YchAwP/1GJuBAG0NitqStT46SWnBfngO3S8XtW6CZIBASY29YBlq7PnmOyzu
	 57s28oILGyKGqrMRa01blz9s+oNFjzjofJU1oE4k=
Date: Mon, 20 Nov 2023 11:02:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Cc: tomas.winkler@intel.com, arnd@arndb.de, alexander.usyskin@intel.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] misc: mei: client.c: return negative error code
 in mei_cl_write
Message-ID: <2023112003-earflap-mule-5b03@gregkh>
References: <20231120095523.178385-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120095523.178385-1-suhui@nfschina.com>

On Mon, Nov 20, 2023 at 05:55:23PM +0800, Su Hui wrote:
> mei_msg_hdr_init() return negative error code, rets should be
> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
> 
> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2: split v1 patch to different patches
> v1: https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/
> 
>  drivers/misc/mei/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9c8fc87938a7..7ea80779a0e2 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  
>  	mei_hdr = mei_msg_hdr_init(cb);
>  	if (IS_ERR(mei_hdr)) {
> -		rets = -PTR_ERR(mei_hdr);
> +		rets = PTR_ERR(mei_hdr);
>  		mei_hdr = NULL;
>  		goto err;
>  	}
> -- 
> 2.30.2
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
