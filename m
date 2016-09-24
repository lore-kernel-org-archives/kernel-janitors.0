From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 17:04:18 +0000
Subject: Re: Input-gameport: Use kmalloc_array() in joydump_connect()
Message-Id: <fc3b7c3c-74b6-4821-4b5a-f6d7b51868a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
 <7ff91d13-9111-c75a-1c1a-e119025866e7@users.sourceforge.net>
 <20160924164251.GC40187@dtor-ws>
In-Reply-To: <20160924164251.GC40187@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> * A multiplication for the size determination of a memory allocation
>>   indicated that an array data structure should be processed.
>>   Thus use the corresponding function "kmalloc_array".
>>
> 
> -ENOPARSE.

Do you find an other wording better?


The script "checkpatch.pl" can point information out like the following.

WARNING: Prefer kmalloc_array over kmalloc with multiply


Regards,
Markus
