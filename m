From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Fri, 25 May 2007 08:40:16 +0000
Subject: [KJ] Re: [PATCH] old declaration ritchie style fix
Message-Id: <4656A0F0.4050909@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jemb1u.fsf@wanadoo.fr> <46568F7F.1040100@gmail.com>
In-Reply-To: <46568F7F.1040100@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Jiri Slaby wrote:
> Yoann Padioleau napsal(a):
>>  static int
>> -receivepkt (target, buffer)
>> -	int target;
>> -	unsigned char *buffer;
>> +receivepkt (int target, unsigned char *buffer)
> 
> When you are at it, you can also get rid of bsd return-type-on-its-own-line
> style

return-type-on-its-own-line is IMO OK if it occurs consistently in a
file.  It can improve readability particularly if long return types are
combined with long function names.

> + remove the space before parenthesis.

Indeed.
-- 
Stefan Richter
-===-=-== -=-= =--http://arcgraph.de/sr/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
