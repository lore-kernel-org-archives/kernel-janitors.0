From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 31 Jul 2014 09:47:26 +0000
Subject: Re: [patch] staging: comedi: ni_tio: remove some dead code
Message-Id: <53DA10AE.3040100@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731092918.GD30276@mwanda>
In-Reply-To: <20140731092918.GD30276@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2014-07-31 10:29, Dan Carpenter wrote:
> These conditions can never be true because "i" is always one more than
> NI_660X_MAX_RTSI_CHAN after the loop.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
