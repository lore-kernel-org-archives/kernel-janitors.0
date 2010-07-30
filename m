From: Jiri Slaby <jirislaby@gmail.com>
Date: Fri, 30 Jul 2010 12:44:37 +0000
Subject: Re: [PATCH 1/9] staging: dt3155: check put_user() return value
Message-Id: <4C52C935.5020900@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488030-20697-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488030-20697-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>

On 07/30/2010 01:07 PM, Kulikov Vasiliy wrote:
> put_user() may fail, if so return -EFAULT.
> Also compare count with copied data size, not size of struct with these
> fields.

Please do whitespace cleanup separately. We cannot review this.

-- 
js
