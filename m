From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Wed, 07 Mar 2012 06:01:02 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <4F56F99E.3000206@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com> <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com> <20120307060017.GP22598@mwanda>
In-Reply-To: <20120307060017.GP22598@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, chris+android@zenthought.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org




-------- Original Message --------
From: Dan Carpenter
Sent: 2012年03月07日 星期三 09时00分17秒
To: Zhengwang Ruan
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and
buffer_size before used
> On Wed, Mar 07, 2012 at 10:36:58AM +0800, Zhengwang Ruan wrote:
>> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
>> 'buffer' is used as returned value, and 'buffer_size' is initialized using
>> uninitialized_var to clear warning.
>>
>> Signed-off-by: Zhengwang Ruan<ruan.zhengwang@gmail.com>
> These are resends.  Why are you resending these?

I found I did not send this patch to everyone listed by 
get_maintainer.pl, and I didn't get any response, so I made another try 
today. :-)

Thanks,
-Zhengwang

> regards,
> dan carpenter
>

