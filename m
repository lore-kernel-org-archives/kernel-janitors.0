From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 23 Apr 2015 05:45:53 +0000
Subject: Re: [PATCH 0/15]Remove unneeded casts of memory-alloc function return values
Message-Id: <alpine.DEB.2.10.1504230745430.2812@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429767245-32453-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429767245-32453-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Thu, 23 Apr 2015, Firo Yang wrote:

> The memory-alloc() functions return a void pointer, so when
> assigning to a pointer type variable there is no need to cast
> the return value.

If you used a tool to find these, it would be nice to give credit to that
tool.

julia

>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
