From: walter harms <wharms@bfs.de>
Date: Mon, 28 Mar 2005 19:19:27 +0000
Subject: Re: [KJ] critical bug in strncpy()
Message-Id: <424858BF.9080707@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49508432798038637=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503281155.16199.vicente.feito@gmail.com>
In-Reply-To: <200503281155.16199.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============49508432798038637==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Ryan Anderson wrote:
> On Mon, 2005-03-28 at 17:31 +0200, walter harms wrote:
> 
>>hi all,
>>
>>i do not think this is intended. surely you copy data from
>>src to tmp++ but using a large value (> strlen(src) ) for count will 
>>access some strange areas where no code should go.
> 
> 
> It's not a strange area, it's the rest of the destination buffer.
> The rest of the destination buffer is filled with the value 0.  This
> guarantees that strncpy prevents any information leakage via this
> buffer.  This has the nice side effect that a buffer can be reused
> without an explicit memset if you know that strncpy will be used to
> repopulate it between uses.
> 
> This is a security feature.
> 
> src is not accessed beyond the minimum of strlen(src) and n, so there is
> no chance of an out of bounds access on that, and the "n" that we are
> given is the limit to the buffer pointed at by dest, so there is no out
> of bounds access there.
> 
> 
>>the defined behavier of strncpy is to copy a string that terminates with 
>>\0, count describes an upper limit what is reached first should 
>>terminate the copy. every version of strncpy works that way.
>>maybe its not an critical bug (as src is not increased)  but
>>1. it *will* access unintended areas beyond  \0
> 
> 
> src is not accessed beyond the minimum of strlen(src) and n, so there is
> no chance of an out of bounds access on that, and the "n" that we are
> given is the limit to the buffer pointed at by dest, so there is no out
> of bounds access there.
> 
> 
>>2. rule of least surprise is violated
> 
> 
> Well, I can't disagree here - but I don't think the surprise is in any
> way detrimental.  There is simply no bug to exploit here.
> 
> 
>>3. other ppl may find other uses to this bug
>>4. the fix is simple
> 
> 
> The fix opens a hole for potential information leakage to user space.
> 
> Have you audited all callers of strncpy to ensure that they do not
> implicitly use this clearing of the buffer to guarantee that information
> is not leaked to userspace?
> 

you are right *when* n is the size of the destination buffer.
but take a look at this time of code from 
./net/irda/ircomm/ircomm_param.c:
strncpy(self->settings.port_name, param->pv.c, 32);

if works fine IF port_name[33] is true. but then he can use strcpy(). 
why does user use actualy strNxxx() because the limit will prevent 
access beyond \0 and at least n. clearing should be done within strncpy 
(if you want that) using a clear *foo++=0 so its visible

look at the asm code for m68k (i can not read i386, that the reason :)
they stop coppying at \0 and n.

the main problem with strncpy is still:
it has the same name as the POSIX cousin but it does not behave equal.
it does not terminate the dststring automaticly with \0 (neither does 
POSIX, an error IMHO,strlcpy does).
it will access the dstbuffer beyond \0 if n is large enought, ok it will 
fill it with \0 but who many people will be aware of it ?
i admit falling into a trap when expecting the same behavier as POSIX 
strncpy() but who will not ? exspecialy if its not documented.



re,
	walter







--===============49508432798038637==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49508432798038637==--
