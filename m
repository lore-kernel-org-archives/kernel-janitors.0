From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 29 Jul 2010 08:18:19 +0000
Subject: Re: [Cocci] correct handling of return values
Message-Id: <4C51394B.2060306@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> I'm currently working on this task:
> http://kernelnewbies.org/KernelJanitors/Todo/ReturnCodes
> 
> I think this task can be partly done with coccinelle. The most often cases of
> invalid handling is no handling :)
> 
> I am not guru of coccinelle, but I think it is very useful here. So,
> I've written basic script of finding common errors, but it is not ideal.

Were any improvements achieved since my request "Detection of ignored function
return values" that will help in this use case?
http://lists.diku.dk/pipermail/cocci/2010-February/000690.html
http://www.mail-archive.com/cocci@diku.dk/msg00157.html

Regards,
Markus
