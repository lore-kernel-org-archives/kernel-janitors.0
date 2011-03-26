From: Mike Isely <isely@isely.net>
Date: Sat, 26 Mar 2011 18:07:37 +0000
Subject: Re: [PATCH 3/6] [media] pvrusb2: check for allocation failures
Message-Id: <4D8E2B69.8010005@isely.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110326015221.GH2008@bicker> <alpine.DEB.1.10.1103252333150.12072@ivanova.isely.net> <20110326064804.GL2008@bicker>
In-Reply-To: <20110326064804.GL2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, isely@pobox.com

I'll look at the surrounding code and see what makes sense there. Having 
an error leg for allocation failures is a useful thing.

-Mike


Dan Carpenter wrote:
> On Fri, Mar 25, 2011 at 11:33:36PM -0500, Mike Isely wrote:
>   
>> Acked-By: Mike Isely <isely@pobox.com>
>>
>>     
>
> I'd need to reformat this one to get it to apply... :/  It doesn't
> actually fix the bug so it's not worth it.
>
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   


-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8

