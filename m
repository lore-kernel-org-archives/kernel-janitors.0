From: "Dan Carpenter" <error27@gmail.com>
Date: Tue, 03 Oct 2006 09:13:26 +0000
Subject: Re: [KJ] [PATCH] check_/request_region fixes: sound/oss/pss.c
Message-Id: <a63d67fe0610030213l645e04c1q9b0e1fa45b41f902@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159849720.5147.8.camel@monet>
In-Reply-To: <1159849720.5147.8.camel@monet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/2/06, Kevin Lo <kevlo@kevlo.org> wrote:
> Hi,
>
> Attached patch is to get rid of check_region and replace with
> request_region.
>
>         Kevin
>

Nope.  This is wrong.  You have to replace both check_region() and
modify the call to request_region().  Look through the list for
examples on how to do it.

Also don't send the patch as an attachment, just include it in your
email.  But make sure the lines don't wrap and the tabs are preserved.

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
