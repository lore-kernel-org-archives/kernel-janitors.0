From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 25 May 2004 17:42:06 +0000
Subject: Re: [Kernel-janitors] [announce] kjt patch-set for 2.6.7-rc1
Message-Id: <20040525174206.GO1466@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50310633292615026=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524100025.GB1949@sputnik.stro.at>
In-Reply-To: <20040524100025.GB1949@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============50310633292615026==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

salut luiz!!


On Mon, 24 May 2004, Luiz Fernando N. Capitulino wrote:

> Em Mon, May 24, 2004 at 12:00:25PM +0200, maximilian attems escreveu:
..
> 
> | will try to release on weekly/10days base.
> 
>  Why not 5 days ? Are you too busy ? Maybe, we can have a
> maintainer per week (five utils days).

hmm that would mean in 4 days from now, 
sure i'm on university and should pass exams primarily..
i may do that from time to time, but we don't produce that
many patches that it makes sense to me.

 
> | same rules applies for kjt as of previous kj by Randy:
> | patch that gets an objection on the list don't get in 
> | until reworked rediff.
> 
>  I have a suggestion here. Why not apply the patch _even_
> it does have a simple objection ? Of course, if a Mantainer
> says "don't", that's ok to drop. But if the patch is
> generating a discussion, it could be applyed.
> 
>  What do you think ?

the primarily goal of kjt should be to collect patches 
that are suitable for the official kj release from acme.
most objection on the kj mailing list are pretty funded.
but you are right that the rules for kjt shouldn't be too tight.

 
> | +string_form_drivers
> | From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
> | +keyboard_ptr_to_string
> 
>  I'm wondering about this patch, it is still alive !
> 
>  It was my first patch in Janitors, does have about one year...

/me laughs
yeeah, i know mine above is not much better,
they are still not merged, but we had that double check of size
by domen puncer, that was quite wired, he got bigger sizes by them.
(he used a red hat machine with gcc 3.3.3, if i remember correctly)
so i don't know if those should really be pushed.

what i would love to see is that people use kjt for there own kernels,
so that we can catch bugs in our patches before sending them out!

thanks a lot for your nice mail. :)
a+ maks


--===============50310633292615026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50310633292615026==--
