From: Oliver Neukum <oliver@neukum.org>
Date: Wed, 13 Feb 2013 12:06:24 +0000
Subject: Re: [patch] [SCSI] dc395x: uninitialized variable in device_alloc()
Message-Id: <3015897.zxxipoZ9rM@linux-5eaq.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130211190317.GA19768@elgon.mountain>
In-Reply-To: <20130211190317.GA19768@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ali Akcaagac <aliakc@web.de>, Jamie Lenehan <lenehan@twibble.org>, "James E.J. Bottomley" <JBottomley@parallels.com>, dc395x@twibble.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 11 February 2013 22:03:18 Dan Carpenter wrote:
> This bug was introduced back in bitkeeper days in 2003.  We use
> "dcb->dev_mode" before it has been initialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Oliver Neukum <oliver@neukum.org>
