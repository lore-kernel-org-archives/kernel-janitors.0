From: Vicente Feito <vicente.feito@gmail.com>
Date: Sun, 27 Mar 2005 11:34:15 +0000
Subject: Re: [KJ][PATCH] kj-devel.pl - comments
Message-Id: <200503271134.15777.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Great!
I'll implement those, I was also thinking on implementing this kind of 
checking:
if (p)
    kfree(p);
(since kfree deals with null pointers as well)

I'm not sure because some people think that is more expensive to make the call 
than the check, arguing between branch prediction vs stack overhead is common 
in lkml afaik, which one do you think is better?(Other people is free to go 
here as well:)

I'm thinking on adding checks for intermodule and taskqueues, I don't know how 
people feel about it but I believe is time to do it, since they are 
deprecated but still in some places.

Vicente
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
