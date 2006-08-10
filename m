From: "Francois Barre" <francois.barre@gmail.com>
Date: Thu, 10 Aug 2006 09:00:25 +0000
Subject: Re: [KJ] First cleanup patch
Message-Id: <fd8d0180608100200h22edd27byc07f369d5656844c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1155191368.10382.20.camel@localhost.localdomain>
In-Reply-To: <1155191368.10382.20.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>  G'day,
Hi Steven,

>  PS. I am having difficulties fighting with evolution over line wraps, can
> someone let me know if this ends up being html or clean text.

Your mail shows as a multi-part MIME message, with a clean version and
a html one...
The patch does not seem affected with line wrap, but you may want to
re-post your mail in a pure text format...

I did not have a look on copy_to_user() yet, but what happens if it
answers with a 0 value ? (with regards to your comment about a
possible infinite loop).

Regards,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
