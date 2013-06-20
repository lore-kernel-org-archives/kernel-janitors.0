From: Alessandro Rubini <rubini@gnudd.com>
Date: Thu, 20 Jun 2013 14:09:47 +0000
Subject: Re: [patch] FMC: fix error handling in probe() function
Message-Id: <20130620140947.GA9773@mail.gnudd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130620081018.GB15095@elgon.mountain> 
In-Reply-To: <20130620081018.GB15095@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The call to kzalloc() wasn't checked.
> The dev_info() message dereferenced freed memory on error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alessandro Rubini <rubini@gnudd.com>

Thanks!

