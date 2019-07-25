From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 25 Jul 2019 07:46:00 +0000
Subject: Re: [PATCH 1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <e3a37d93-0353-ebed-948a-991add184616@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907242040490.10108@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: David Laight <David.Laight@ACULAB.COM>, linux-kernel@vger.kernel.org

> New version.  I check for non-use of the return value of strlcpy and
> address some issues that affected the matching of the case where the first
> argument involves a pointer dereference.

I suggest to take another look at corresponding implementation details
of the shown SmPL script.


> \(strscpy\|strlcpy\)(e1.f, e2, i2)@p

Can the data access operator “->” (arrow) matter also here?


> @@
> identifier r.i1,r.i2;
> type T;
> @@
> struct i1 { ... T i1[i2]; ... }

Will an additional SmPL rule name be helpful for this part?


> @@
> (
> -x = strlcpy
> +stracpy
>   (e1.f, e2
> -    , i2
>   )@p;
>   ... when != x
>
> |

I wonder about the deletion of the assignment target.
Should the setting of such a variable be usually preserved?

Regards,
Markus
