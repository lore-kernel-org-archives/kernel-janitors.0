From: Arend van Spriel <arend@broadcom.com>
Date: Wed, 03 Dec 2014 12:39:01 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <547F0465.407@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda> <547F0297.6030202@users.sourceforge.net>
In-Reply-To: <547F0297.6030202@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

On 12/03/14 13:31, SF Markus Elfring wrote:
>> diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
>> index 9f28b14..9c8a234 100644
>> --- a/Documentation/CodingStyle
>> +++ b/Documentation/CodingStyle
>> @@ -392,7 +392,12 @@ The goto statement comes in handy when a function exits from multiple
>>   locations and some common work such as cleanup has to be done.  If there is no
>>   cleanup needed then just return directly.
>>
>> -The rationale is:
>> +Choose label names which say what the goto does or why the goto exists.  An
>> +[...]  Avoid
>> +using GW-BASIC names like "err1:" and "err2:".  Also don't name them after the
>> +goto location like "err_kmalloc_failed:"
>
> I find this documentation approach not safe and clear enough so far.
>
> * How should the reference to an other programming language help in the understanding
>    of the recommended naming convention for jump labels?
>
> * To which source code place should the word "location" refer to?
>    - jump source
>    - jump target

I think you digested the paragraph in too small bits. The term "goto 
location" looks synonymous to "jump source" to me.

Regards,
Arend

> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe backports" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

