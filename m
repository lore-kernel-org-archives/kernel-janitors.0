From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Sep 2015 13:16:33 +0000
Subject: Re: [PATCH] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <55F81A31.3040808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
 <55F816BC.5050407@users.sourceforge.net>
 <alpine.DEB.2.10.1509151505240.2537@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509151505240.2537@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>>  v@p
>> (
>> *< 0
>> |
>> *<= 0
>> )
> 
> It does not, and is not intended to, work.  The branches of a disjunction
> should be complete expressions.

Will the following SmPL approach be more appropriate then?

(
*v@p < 0
|
*v@p <= 0
)

Regards,
Markus
