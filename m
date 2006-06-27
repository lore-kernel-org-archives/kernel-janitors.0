From: Greg KH <greg@kroah.com>
Date: Tue, 27 Jun 2006 08:04:49 +0000
Subject: Re: [KJ] [patch 1/1] kernel/resource.c: __request_region argument
Message-Id: <20060627080449.GA28064@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7cf77ad0606270022g174a2fbdje69d94ebebd32363@mail.gmail.com>
In-Reply-To: <c7cf77ad0606270022g174a2fbdje69d94ebebd32363@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 27, 2006 at 03:22:05AM -0400, Brian Jung Myeng Lee wrote:
> Add argument check for parameters n and name.

Why?  What is that helping out with?  This might break some
already-running code...

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
