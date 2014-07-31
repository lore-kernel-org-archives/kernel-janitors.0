From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Thu, 31 Jul 2014 17:35:44 +0000
Subject: RE: [patch] staging: comedi: ni_tio: remove some dead code
Message-Id: <DC148C5AA1CEBA4E87973D432B1C2D8825F2E5BC@P3PWEX4MB008.ex4.secureserver.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731092918.GD30276@mwanda>
In-Reply-To: <20140731092918.GD30276@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday, July 31, 2014 2:29 AM, Dan Carpenter wrote:
> These conditions can never be true because "i" is always one more than
> NI_660X_MAX_RTSI_CHAN after the loop.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>

