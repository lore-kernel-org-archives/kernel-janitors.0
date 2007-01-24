From: "Chris Miller" <lordsauronthegreat@gmail.com>
Date: Wed, 24 Jan 2007 20:08:03 +0000
Subject: Re: [KJ] are there any issues regarding the abs() and labs() macros?
Message-Id: <e5a3e9ac0701241208l4be1ff5ci95cad11323ab18c4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240701560.4864@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 1/24/07, Robert P. J. Day <rpjday@mindspring.com> wrote:> On Wed, 24 Jan 2007, Chris Miller wrote:>> > I just read about a clever way to use bitwise operators to do that> > kind of work.  When I get home I'll dig it up and see if it's> > possible to implement it.> >> > It was really neat.  I'm still learning about bitwise junk, but it> > was a really slick solution (more so than the macro I read on the> > wiki).>> i googled on "bitwise" "absolute" "value" and came up with numerous> hits, including this one:>>  http://www.thescripts.com/forum/thread212935.html>> haven't read it yet, but it looks interesting.  again, the issue might> be machine word size, but i'll know more after i finish reading it.
I scanned it.  It wasn't exactly the approach I read...
About the size of the datatype...  wouldn't it be simpler to usesizeof to find the sign bit and flip it to the off position afterwe've determined it's not an unsigned datatype?  That way it would besort of a pseudo-template macro...
Improvising horribly (NOT production code, just floating a super-general idea)
#define abs(x) if(x<0) /* find the sign bit using sizeof(x) and flipit using a bitwise operator */
It's really what the current macro does already.  I'd have to figureout how to implement the two and run some tests to see if either isactually faster than the other.  (I just leave my laptop running sometests for a while and then come back to see the verdict).
-- =  =  =  Ƒ 5 |) 3 |/  =  =  ==    ( 0 |) 3    \|/ 4 |2 |2 | 0 |2    ==  =  7 | |\| µ Ж    6 µ |2 µ  =  =
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
