From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 08 May 2015 12:11:12 +0000
Subject: Re: [PATCH v2 8/8] staging: lustre: code cleanup - normalize whitespace
Message-Id: <alpine.DEB.2.10.1505081408050.2648@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu> <1431086460-22455-16-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-16-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org

>  static __u32 kiblnd_cksum(void *ptr, int nob)
>  {
> -	char  *c  = ptr;
> -	__u32  sum = 0;
> +	char *c  = ptr;
> +	__u32 sum = 0;

Maybe drop the extra space after c here.

julia
