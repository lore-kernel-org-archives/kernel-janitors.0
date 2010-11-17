From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 08:49:04 +0000
Subject: Re: [patch] Staging: ft1000-usb: copying to wrong location
Message-Id: <20101117084904.GH31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101117065505.GG31724@bicker>
In-Reply-To: <20101117065505.GG31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 17, 2010 at 09:55:05AM +0300, Dan Carpenter wrote:
> We made "dpram_data" a pointer ealier but missed one place which needs
> to be changed.  It causes a compile error with
> CONFIG_DEBUG_STRICT_USER_COPY_CHECKS=y
> 

Never mind.  Steven Rostedt beat me to it.

regards,
dan carpenter


