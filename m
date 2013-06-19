From: Alessandro Rubini <rubini@gnudd.com>
Date: Wed, 19 Jun 2013 17:57:58 +0000
Subject: Re: [patch -next] FMC: NULL dereference on allocation failure
Message-Id: <20130619175758.GA23533@mail.gnudd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1371658504.2038.25.camel@joe-AO722>
  <20130619160101.GA29108@mwanda>
In-Reply-To: <1371658504.2038.25.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: dan.carpenter@oracle.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>> +	arr->record = kzalloc(sizeof(arr->record[0]) * n, GFP_KERNEL);
>> +	arr->subtree = kzalloc(sizeof(arr->subtree[0]) * n, GFP_KERNEL);

> n comes from the hardware no?

Yes. Length of hardware description array.

> Maybe make these kcalloc too.

I'm not a fan of kcalloc. I think it removes readability. I remeber
kernel patches to swap the arguments, because people get them wrong.
Even Kernighan said it was a design error (in "the practice of
programming").  That said, I'm not the leader here.

thanks
/alessandro
