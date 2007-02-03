From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sat, 03 Feb 2007 01:44:52 +0000
Subject: Re: [KJ] [RFC] Regarding abs() and labs()
Message-Id: <20070202174452.6074cfa0.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E1C8.2040105@student.ltu.se>
In-Reply-To: <45C3E1C8.2040105@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 03 Feb 2007 02:13:44 +0100 Richard Knutsson wrote:

> Hello all
> 
> Just took a look at abs() and can not understand why it seem so 
> overcomplicated. Why not just:
> 
> #define abs(x)	((x) < 0) ? -(x) : (x))

It's almost that simple.  It just adds a local __x so that
'x' won't be evaluated multiple times as it would in the simpler
version.  Multiple evaluations (of an expression) (that could
have side effects) would take more CPU horsepower and could
have bad side effects as well.

> and skip labs() (not used anyway)
> + it gives a warning with -W if x is of a unsigned type ("condition is 
> always false" or similar).
> But remember to use %u when printing an unsigned, took me a while before 
> I understood how an unsigned could contain a "negative" value :)

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
