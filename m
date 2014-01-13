From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2014 15:48:29 +0000
Subject: Re: [PATCH 4/4] staging: tidspbridge: delete useless variable
Message-Id: <20140113154829.GF7444@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1389629847-5330-1-git-send-email-Julia.Lawall@lip6.fr>
 <1389629847-5330-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1389629847-5330-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Omar Ramirez Luna <omar.ramirez@copitl.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 13, 2014 at 05:17:27PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The variable status is initialized to either 0 or an error code.  Return
> status to propagate the error value.
> 

Could you update the subject to say that the patch was a bugfix.

regards,
dan carpenter

