From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 07 Mar 2012 05:46:16 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <20120307054616.GA7775@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com>
 <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Cc: arve@android.com, chris+android@zenthought.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 07, 2012 at 10:36:58AM +0800, Zhengwang Ruan wrote:
> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
> 'buffer' is used as returned value, and 'buffer_size' is initialized using
> uninitialized_var to clear warning.

Doesn't say that for me at all, what version of gcc are you using?  I'm
using 4.6.2 here, and if you are using an older version, then please
upgrade to one smarter than the one you are using.

As you are trying to paper over gcc issues, I can't take this patch,
sorry.

greg k-h
