From: "Richard Genoud" <richard.genoud@gmail.com>
Date: Thu, 11 Sep 2008 08:26:55 +0000
Subject: Re: code after return
Message-Id: <80b317760809110126q1ac0897crd560bdc0d780d38@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0808312231550.5157@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0808312231550.5157@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2008/8/31 Julia Lawall <julia@diku.dk>:
> Below is a list of some places (file and function name) where there is
> some code after a return or goto.  Most of the time, the return is in a
> switch case, and the code after the return is a break.  I was wondering
> whether it would be useful to do something about these?  Or is the thought
> that it has no impact on the compiled code, so it doesn't matter?  Or is
> it actually desirable to have a break in every switch case, even if it
> amounts to dead code?
>
> thanks,
> julia

IHMO, those breaks (and the superfluous semicolon) should be removed.
In the CodingStlye document there's a switch/case example (actually,
it was a placing braces example) like that :

switch (action) {
case KOBJ_ADD:
        return "add";
case KOBJ_REMOVE:
        return "remove";
case KOBJ_CHANGE:
        return "change";
default:
        return NULL;
}
So, it seems that there's no rule like having a break in every switch case.

Anyone, another opinion ?

richard.
