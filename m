From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 12 Apr 2018 15:20:31 +0000
Subject: Re: [PATCH][next] staging: ks7010: fix null pointer dereference on priv on error exit
Message-Id: <3e2e4562-ca52-945a-bbdd-7e22b89a3842@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180412145756.24949-1-colin.king@canonical.com>
 <20180412151229.7san3ynhl5lbqgs4@mwanda>
In-Reply-To: <20180412151229.7san3ynhl5lbqgs4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Quytelda Kahja <quytelda@tamalin.org>

On 12/04/18 16:12, Dan Carpenter wrote:
> This isn't right.  It introduces a leak.

Yup, and I see Gustavo is working on a correct fix, I'll leave that to him.
> 
> regards,
> dan carpenter
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

