From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Date: Mon, 28 Jan 2008 00:18:17 +0000
Subject: Re: #if 0
Message-Id: <36ca99e90801271618w365145e7w15a22335f3a4a812@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
In-Reply-To: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > Perfect. What was your problem?
>
> The problem was that I didn't expect to see different md5sum after removing
> some dead code.
>
> I'm working on a series of cleanup patches and I want to be sure that
> I'm NOT changing
> the .o file. I want to be sure that every single patch is just
> cleaning the code.
>
> What I wanted to do was:
> make a/b/c.o
> md5sum a/b/c.o
> applying the first patch
> make clean && make a/b/c.o
> md5sum a/b/c.o
> and so on.
>
> Should I add the strip command to the procedure?
> And if yes... why?
If you want to use md5sum, than yes, because of the debug information
inside the .o, and this includes line numbers, and these will change,
if you remove dead code.

You can look at the elfcmp tool. But I have no experience with this tool.

Bert
>
> Thanks!
>
>
> Ciao,
> --
> Paolo
> http://paolo.ciarrocchi.googlepages.com/
>
