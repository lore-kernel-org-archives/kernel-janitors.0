From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Mon, 30 Oct 2006 12:52:38 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <4652.41.242.13.147.1162212758.squirrel@krooninfsys.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Darren Jenkins wrote:
>>While you are spot on here and that explains what the code did before
>>the patch, I think the point that Matthew Wilcox was getting at is
>>that _after_ this patch the "do { } while (0)", now apears to wrap a
>>_single_ "while (cond) { }" statement, making it surperflous.
> Yes,this was my point too,but then I tryied to maintain the general style
> of the code fragment,
> so now the code is conformant to the kernel code style and it's clearer
> than before.

As already explained, the do { } while(0) is actually there for a very
good reason.

Consider a fictitious macro called m() that looks something like:

#define m()  while(foo) { blah() }

Now, if I use that macro in the following construct I've got a problem:

if (bleh)
    m();
else
    bar();

That won't actually compile since it expands to:

if (bleh)
    while(foo) { blah() };
else
    bar();

Now, that semicolon at the directly after the } is what causes the
problem.  So wrapping it up in a do {} while(0) solves that problem:

if (bleh)
    do {
        while(foo) { blah() }
    while(0);
else
    bar();

Does actually work.

My 5c worth,

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
