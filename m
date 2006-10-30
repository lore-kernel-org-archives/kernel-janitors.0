From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
Date: Mon, 30 Oct 2006 13:52:12 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061030135212.71802.qmail@web90302.mail.mud.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jaco Kroon <jaco@kroon.co.za> wrote:
>Either way.  IMHO it's always a good idea to use those do {} while(0)
>wrappers even though they are not needed for current usage.  Remember that
>from code a macro call looks exactly like a function call, as such I would
>reckon it's best to try and keep them looking like that, so imho it should
>always be there.  It's safer, and is more future proof than without them.
Yes,I agree with you,and if you look at my patch 
you'll see that I used the do{}while(0) syntax.

Giangiacomo








_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
