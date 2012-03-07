From: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Date: Wed, 07 Mar 2012 04:58:16 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <4F56EAE8.8060502@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com>	<1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com> <CAMP5XgfWBj_V+21avHyEbViYK1N0fHBmyj6CcYry0Fd4QttgqQ@mail.gmail.com>
In-Reply-To: <CAMP5XgfWBj_V+21avHyEbViYK1N0fHBmyj6CcYry0Fd4QttgqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Cc: gregkh@linuxfoundation.org, chris+android@zenthought.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org




-------- Original Message --------
From: Arve Hjønnevåg
Sent: 2012年03月06日 星期二 20时01分58秒
To: Zhengwang Ruan
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and 
buffer_size
before used
> On Tue, Mar 6, 2012 at 6:36 PM, Zhengwang Ruan<ruan.zhengwang@gmail.com>  wrote:
>> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, and
>> 'buffer' is used as returned value, and 'buffer_size' is initialized using
>> uninitialized_var to clear warning.
> Why do you clear the warning on buffer_size with uninitialized_var()
> but not on buffer?

struct binder_buffer *buffer;
size_t buffer_size;
struct rb_node *best_fit = NULL;

I see 'best_fit' is initialized by being directly assigned a NULL 
pointer, I think it should be better to initialize pointer in this way.

> Neither variable is used before being initialized.
>
I got the following compiling warning against buffer ans buffer_size:

drivers/staging/android/binder.c:719:24: warning: ‘buffer’ may be used 
uninitialized in this function
drivers/staging/android/binder.c:720:9: warning: ‘buffer_size’ may be 
used uninitialized in this function

Thanks,
-Zhengwang



