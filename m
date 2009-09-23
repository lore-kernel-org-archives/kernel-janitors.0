From: "Dr. David Alan Gilbert" <linux@treblig.org>
Date: Wed, 23 Sep 2009 14:46:01 +0000
Subject: Re: char* -> char[] replacement
Message-Id: <20090923154555.GA6185@gallifrey>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090921173400.GA1942@gallifrey>
In-Reply-To: <20090921173400.GA1942@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

OK, I've spotted my mistake - but further digging is keeping me
confused about what the expected behaviour is, especially with modern gcc's

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> Hi,
>   I noticed the apparently simple entry in the TODO list saying:
> 
>      From: Jeff Garzik
> 
>      1) The string form
> 
>         [const] char *foo = "blah";
>            creates two variables in the final assembly output, a
>            static string, and a char pointer to the static string.
>            The alternate string form
> 
>         [const] char foo[] = "blah";
>            is better because it declares a single variable.
> 
>         For variables marked __initdata, the "*foo" form causes only
>         the pointer, not the string itself, to be dropped from the
>         kernel image, which is a bug. Using the "foo[]" form with
>         regular 'ole local variables also makes the assembly shorter.

<snip my original message>

I've been trying this out on a little standalone hello world.

I'd originally replaced char *foo = "blah" by char foo[] = "blah"
and been surprised at the extra code generated - but actually thinking
about it, inside a function this makes sense - every time through the
compiler has to refresh the array since you might have changed it -
so I'm not sure that substitution ever makes sense.

Life gets more interesting with const - and I don't understand why.
On gcc 4.2 if I declare const char foo[] = "blah"  then blah
ends up in .rodata.str, if you use it multiple times it gets shared.
However with 4.3.4 or 4.4.1 (all ubuntu packaged versions)
the const char foo[]="blah" case generates code to write the string
to the stack on each function call - why??? Is this a compiler bug
or is there a reason for this change?

Finally,
  static const char foo[] = "blah";

This ends up putting the constants in a .rodata section rather than
.rodata.str and doesn't share multiple uses of the same string within
the same .c file.

These were all done for local variables; with global variables it
doesn't look much better; const char foo[] does put things in .rodata
but again none-shared, as does static const char foo[].

All these tests were done on x64.

So, too summarise I'm a bit confused, I think the advise to change
  char* foo="hello" to char foo[]="hello" appears to be bogus without
the const.  With the const then I'm not sure the newer compilers are
behaving as expected.

  Sharing only seems to happen with the char* foo="hello".

Maybe in the case of initdata some of this helps, but I can't see outside
that - but I can see it causing code duplication or with the newer
compilers const char foo[] generating more code for no good reason.

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM,SPARC,PPC & HPPA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
