From: Domen Puncer <domen@coderock.org>
Date: Sun, 27 Aug 2006 12:30:45 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <20060827123045.GA6324@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 24/08/06 01:58 +0530, Raseel Bhagat wrote:
> Hi ,
> 
> On 8/23/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > True, but that isn't the worst sin of this patch. What to do with
> >
> >         #ifdef MODULE
> >
> > sprinkled all over touched files and left?
> >
> I don't understand how is that a problem. ?
> There are appropriate #endif s aren't there ?

#ifdefs in .c file are the sin, especially when they can be avoided.
Oh, and trimming Cc: is one too.


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
