From: Yoann Padioleau <padator@wanadoo.fr>
Date: Wed, 28 Mar 2007 07:54:43 +0000
Subject: Re: [KJ] What do "#if 1" and "#if 0" do?
Message-Id: <87ejn9n6po.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
In-Reply-To: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthias Kaehlcke <matthias.kaehlcke@gmail.com> writes:

> El Wed, Mar 28, 2007 at 07:24:35AM +0000 Guanqun Lu ha dit:
>
>> I found the webpage:
>> http://fsdev.net/wiki/index.php?title=If_0_or_if_1_directives
>> And I'm just wondering what do the two directives do.
>
> my interpretation is that they are used for activating (#if 1) and
> deactivating (#if 0) code.

We often use #if 0 ... #endif for commenting a big region of code.
One might think that we could also use /* ... */ but if what is in the middle
contain some C comments, then you can not, because C does not
handle nested comments.

>
> m.
>
> -- 
>               Insanity: doing the same thing over and over
>                 again and expecting different results
>                             (Albert Einstein)
>                                                                  .''`.
>     using free software / Debian GNU/Linux | http://debian.org  : :'  :
>                                                                 `. `'`
> gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
