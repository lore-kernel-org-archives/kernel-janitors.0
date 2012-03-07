From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Wed, 07 Mar 2012 06:16:20 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <4F56FD34.1090103@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com> <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com> <20120307054616.GA7775@kroah.com>
In-Reply-To: <20120307054616.GA7775@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arve@android.com, chris+android@zenthought.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org




-------- Original Message --------
From: Greg KH
Sent: 2012年03月06日 星期二 21时46分16秒
To: Zhengwang Ruan
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and
buffer_size before used
> On Wed, Mar 07, 2012 at 10:36:58AM +0800, Zhengwang Ruan wrote:
>> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
>> 'buffer' is used as returned value, and 'buffer_size' is initialized using
>> uninitialized_var to clear warning.
> Doesn't say that for me at all, what version of gcc are you using?  I'm
> using 4.6.2 here, and if you are using an older version, then please
> upgrade to one smarter than the one you are using.
>
> As you are trying to paper over gcc issues, I can't take this patch,
> sorry.
>

Ok, I will make another try after updating GCC to 4.6. Thank you for 
your effort!

Thanks,
-Zhengwang

> greg k-h
>

