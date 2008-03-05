From: Derek M Jones <derek@knosof.co.uk>
Date: Wed, 05 Mar 2008 12:13:28 +0000
Subject: Re: [PATCH 6/9] drivers/net/wireless/iwlwifi/iwl-4965.c: Correct
Message-Id: <47CE8E68.5060701@knosof.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802262143570.18200@ask.diku.dk> <20080305063842.GA24495@elte.hu> <70318cbf0803042249j57d7f3a3j7666961a9132b10b@mail.gmail.com> <20080305070201.GA32434@elte.hu> <1204700995.17484.7.camel@brick> <20080305081904.GA17789@elte.hu>
In-Reply-To: <20080305081904.GA17789-X9Un+BFzKDI@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Harvey Harrison <harvey.harrison-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christopher Li <sparse-55XgFHCVCFZAfugRpC6u6w@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, yi.zhu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ipw3945-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-rfM+Q5joDG/XmaaqVzeoHQ@public.gmane.org>, linux-sparse-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

All,

>>> i think there might be similar patterns: "x & !y", "!x | y", "x | !y" ?
>>>
>> Well, (!x & y) and (!x | y) are probably the two that might have been 
>> intended otherwise.  (x & !y), (x | !y) are probably ok.
> 
> i think the proper intention in the latter cases is (x & ~y) and
> (x | ~y).
> 
> My strong bet is that in 99% of the cases they are real bugs and && or 
> || was intended.

Developer knowledge of operator precedence and the issue of what
they intended to write are interesting topics.  Some experimental
work is described in (binary operators only I'm afraid):

www.knosof.co.uk/cbook/accu06a.pdf
www.knosof.co.uk/cbook/accu07a.pdf

The ACCU 2006 experiment provides evidence that developer knowledge
is proportional to the number of occurrences of a construct in
source code, it also shows a stunningly high percentage of incorrect
answers.

The ACCU 2007 experiment provides evidence that the names of the
operands has a significant impact on operator precedence choice.

I wonder what kind of names are used as the operand of unary
operators?

I would expect the ~ operator to have a bitwise name, but the
! operator might have an arithmetic or bitwise name.

-- 
Derek M. Jones                              tel: +44 (0) 1252 520 667
Knowledge Software Ltd                      mailto:derek@knosof.co.uk
Applications Standards Conformance Testing    http://www.knosof.co.uk
