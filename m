From: Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 08 May 2007 11:10:46 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <46405AB6.6040901@msgid.tls.msk.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621444.3598.15.camel@shani-win>
In-Reply-To: <1178621444.3598.15.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shani Moideen <shani.moideen@wipro.com>
Cc: ebiederm@xmission.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Shani Moideen wrote:
>                 ptr = kmap(page);
> -               memset(ptr, 0, PAGE_SIZE);
> +               clear_page(ptr);

I wonder if it's worth to invent kzmap() or something like that... ;)

/mjt
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
