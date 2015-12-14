From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 10:03:23 +0000
Subject: Re: staging: lustre: Rename a jump label for ptlrpc_req_finished() calls
Message-Id: <566E93EB.3000309@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <566D7884.5050407@users.sourceforge.net> <20151214065325.GS5284@mwanda>
 <566E86F3.9010209@users.sourceforge.net> <20151214093121.GU5284@mwanda>
In-Reply-To: <20151214093121.GU5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Oleg Drokin <oleg.drokin@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, lustre-devel@lists.lustre.org

>>> Markus, please stop sending these things to rename out labels unless
>>> there is a bug.  CodingStyle allows out labels.
>>
>> How does this feedback fit to information like the following?
>>
>> "…
>> Chapter 7: …
>> …
>> Choose label names which say what the goto does or why the goto exists.
> 
> A lot of people think "out" says what the goto does and why it exists.

I have got the impression that this short identifier is only partly appropriate.


> I personally don't agree with them

I guess that my opinion goes into a similar direction here.


> but if you look at when I complain about it, it's almost always
> when it causes a bug.

I agree that the combination with bug fixing is more appealing
than an attempt to improve coding style applications.


>> … Avoid using GW-BASIC names …
> 
> Those when people just use numbers for their label names instead of
> words like out1, out2, out4, out5.  It's a different thing.

The difference is not so clear for me as it appears to you.
How many software developers can still remember habits around
the selection of such identifiers from GW-BASIC times?

Regards,
Markus
