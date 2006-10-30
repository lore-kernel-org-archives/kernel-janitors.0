From: Amit Choudhary <amit2030@yahoo.com>
Date: Mon, 30 Oct 2006 03:12:49 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061030031249.39403.qmail@web55614.mail.re4.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



--- Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com> wrote:

> >I don't think the outer do ..... while is necessary anyway.Is there any problem
> >with just deleting them?
> I thought about it,but then I tried to change this misleading code without being too
> destructive,I thought that the previous author could have had a good reason to
> use the do{}while(0).
> 

There are couple of good reasons for using a do - while block in a macro having multiple
statements. Chapter 11 of kernel coding style recommends using the do - while block. A macro is
generally used as:

MACRO(X);   

The semicolon will be handled correctly if the macro is enclosed in a do - while block.

----
                Chapter 11: Macros, Enums and RTL
 
 Macros with multiple statements should be enclosed in a do - while block:
 
 #define macrofun(a, b, c)                       \
         do {                                    \
                 if (a = 5)                     \
                         do_this(b, c);          \
         } while (0)
----

Regards,
Amit


 
____________________________________________________________________________________
Want to start your own business? Learn how on Yahoo! Small Business 
(http://smallbusiness.yahoo.com) 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
