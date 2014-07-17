From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 14:25:13 +0000
Subject: Re: [PATCH 1/3] arch/metag/kernel/cachepart.c: fix failure check
Message-Id: <CANZNk83O6jjQ1-zN2f7pFnv9tfMATLELEuf6=d8KVe6BYP_qyg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405603586-12515-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405603586-12515-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-metag@vger.kernel.org
Cc: james.hogan@imgtec.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

2014-07-17 16:26 GMT+03:00 Andrey Utkin <andrey.krieger.utkin@gmail.com>:
> --- a/arch/metag/kernel/cachepart.c
> +++ b/arch/metag/kernel/cachepart.c
> @@ -99,7 +99,7 @@ void check_for_cache_aliasing(int thread_id)
>         for (cache_type = ICACHE; cache_type <= DCACHE; cache_type++) {
>                 thread_cache_size >                                 get_thread_cache_size(cache_type, thread_id);
> -               if (thread_cache_size < 0)
> +               if (thread_cache_size = (unsigned int)-1)

If it would be better, i can resubmit with addition of signed
variable, like there: https://patchwork.kernel.org/patch/4575881/

-- 
Andrey Utkin
