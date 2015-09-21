From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Sep 2015 14:06:27 +0000
Subject: Re: [PATCH v3] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <56000EE3.7040602@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1509180734350.2064@localhost6.localdomain6>
 <1442831864-25759-1-git-send-email-a.hajda@samsung.com>
 <55FFFFF4.4000007@users.sourceforge.net> <56000777.6060208@samsung.com>
In-Reply-To: <56000777.6060208@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>> * Reuse of "long int"?
> If you mean adding int to 'unsigned long [long]' types, it does not work.

I am surprised.


> For some reason it works only without adding int after long.

The  Coccinelle software should support the term "generic_ctype" from
the SmPL grammar so far, shouldn't it?
http://coccinelle.lip6.fr/docs/main_grammar005.html#ctype


>> * Splitting of the suggested SmPL rule so that each source code check
>> will be connected with appropriate warning messages.
> Personally I prefer one message as it is more compact

It might look convenient to combine a few source code checks.


> and fits quite well in both cases,

I got an other impression.


> but I have no strong fillings with separate message for each case.

* v@p < 0
  Find places where this condition will always be false.

*v@p >= 0
  Find places where this condition will always be true.


Will it help to distinguish these special cases also in your SmPL script
strictly?

Regards,
Markus
