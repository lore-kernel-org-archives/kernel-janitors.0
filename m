From: Andrzej Hajda <a.hajda@samsung.com>
Date: Fri, 25 Sep 2015 10:08:43 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <56051D2B.5040802@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
 <56041BE5.5010005@users.sourceforge.net>
In-Reply-To: <56041BE5.5010005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 09/24/2015 05:51 PM, SF Markus Elfring wrote:
>> +@rs@
>> +position p;
>> +typedef bool, u8, u16, u32, u64, s8, s16, s32, s64;
>> +{char, short int, int, long, long long, s8, s16, s32, s64} vs;
> Can it matter to specify also the type modifier "signed" in this SmPL approach?
> http://coccinelle.lip6.fr/docs/main_grammar005.html#ctype_qualif

According to my tests it does not matter.
Btw I should replace short int, with short, to allow catch short intergers.

>
>
>> +{unsigned char, unsigned short, unsigned int, unsigned long, unsigned long long, size_t, bool, u8, u16, u32, u64} vu;
> How do you think about to reformat such a data type enumeration?

If you mean split line to be below 80 chars, OK.

>
>
>> +@@
>> +
>> +vu@p = vs
>> +
>> +@r@
>> +position rs.p;
>> +identifier v, f;
>> +statement S1, S2;
>> +expression e;
>> +@@
>> +
>> +*v@p = f(...);
> Do you try to check here if the value receiver is at the same source code
> position from the SmPL rule "rs"?

Yes.
Generally I want to catch all assignments of signed function result to unsigned var.
In this script I have implemented it this way:
1. Look for all assignments 'unsigned = signed' (rs rule).
2. Check if signed from rs rule looks as a function call.

Is there better way to do it?

Regards
Andrzej

>
> Regards,
> Markus
>

