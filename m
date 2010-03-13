From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Sat, 13 Mar 2010 12:05:13 +0000
Subject: Re: [patch] tomoyo: fix potential use after free
Message-Id: <201003132105.CDF15561.OVOFHStLJFFQMO@I-love.SAKURA.ne.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100313111422.GA2594@bicker>
In-Reply-To: <20100313111422.GA2594@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com, jmorris@namei.org
Cc: takedakn@nttdata.co.jp, serue@us.ibm.com, haradats@nttdata.co.jp, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:

> The original code returns a freed pointer.  This function is expected to 
> return NULL on errors.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Oh, thank you.
James, please send this patch to 2.6.34-rc1 .

Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

> diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
> index ff51f10..ef89947 100644
> --- a/security/tomoyo/common.c
> +++ b/security/tomoyo/common.c
> @@ -886,6 +886,7 @@ static struct tomoyo_profile *tomoyo_find_or_assign_new_profile(const unsigned
>  	ptr = kmalloc(sizeof(*ptr), GFP_KERNEL);
>  	if (!tomoyo_memory_ok(ptr)) {
>  		kfree(ptr);
> +		ptr = NULL;
>  		goto ok;
>  	}
>  	for (i = 0; i < TOMOYO_MAX_CONTROL_INDEX; i++)
