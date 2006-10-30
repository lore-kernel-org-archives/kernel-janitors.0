From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Mon, 30 Oct 2006 13:46:53 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061030134653.59021.qmail@web90312.mail.mud.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>Jaco Kroon <jaco@kroon.co.za> wrote:
>>As already explained, the do { } while(0) is actually there for a very
>>good reason.
>Maybe I did not explain clearly what I meant with my previous e-mails.
>I know that the do{}while(0) syntax is the right one for macros(and I do know why), but 
>if you look at the code in arch/x86_64/kernel/traps.c, HANDLE_STACK does not seem to
>need this kind of syntax,by looking at how it is used;anyway,to be sure about that,
>I should have checked the entire file and I could have created a bug where it wasn't before.
>What I wanted to do was simply to clear the bad syntax of HANDLE_STACK definition,
>and using the general syntax of do{}while(0) was the better way to do that trying to
>be conservative.
>
>Giangiacomo
well,not the entire file,just a function,anyway.....

Giangiacomo









_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
