From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 10 Jan 2007 11:10:45 +0000
Subject: Re: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <45A4C9B5.3030609@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bernd Petrovitsch wrote:
> On Wed, 2007-01-10 at 11:17 +0100, Richard Knutsson wrote:
> [...]
>   
>> 	if (foo =TRUE) {
>>     
>
> This is IMHO ugly for any definition and implementation of boolean in C.
> Write it as 
>         if (foo) {
> Otherwise why don't we write
>         if ((foo = TRUE) = TRUE) {
> ?
>
> 	Bernd
>   
It sure is! But a quick check:
linux-2.6]$ grep -Er "\=\= *(TRUE|true)" * | wc -l
70
linux-2.6]$ grep -Er "\=\= *(FALSE|false)" * | wc -l
118
suggest it is used (saw a few false-positivs).

This is something that should be mentioned in "CodingStyle", but have 
not got there yet. Care to make a draft/patch?

/Richard Knutsson
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
