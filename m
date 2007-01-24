From: "Chris Miller" <lordsauronthegreat@gmail.com>
Date: Wed, 24 Jan 2007 19:49:03 +0000
Subject: Re: [KJ] are there any issues regarding the abs() and labs() macros?
Message-Id: <e5a3e9ac0701241149y30144030oa0d10acbada25aa1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 1/24/07, Robert P. J. Day <rpjday@mindspring.com> wrote:>>  over at the wiki :-), on this page:>> http://www.fsdev.dreamhosters.com/wiki/index.php?title=Talk:Abs_and_labs>> commenter "n" points out that the labs() macro defined in kernel.h> appears to have no invokers whatsoever anywhere in the source tree,> and wonders if usage of the regular abs() routine might have some type> issues.>> i have no idea.  would anyone care to comment?
I just read about a clever way to use bitwise operators to do thatkind of work.  When I get home I'll dig it up and see if it's possibleto implement it.
It was really neat.  I'm still learning about bitwise junk, but it wasa really slick solution (more so than the macro I read on the wiki).
-- =  =  =  Ƒ 5 |) 3 |/  =  =  ==    ( 0 |) 3    \|/ 4 |2 |2 | 0 |2    ==  =  7 | |\| µ Ж    6 µ |2 µ  =  =
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
