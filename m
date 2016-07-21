From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Jul 2016 21:26:30 +0000
Subject: Re: staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <f5224d82-c25e-3ab0-c0a5-85042664f953@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien> <20160720155333.GE1688@katana>
 <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
 <20160721062726.GC1664@katana>
 <b221aadb-2af7-8d0f-ce8e-99b1efa31edd@users.sourceforge.net>
 <20160721163714.GB1616@katana>
In-Reply-To: <20160721163714.GB1616@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Can you follow expectations around the proposed refactoring of any
>> function implementations?
> 
> I don't understand both questions. Maybe you need to give examples?

I suggest to try the following script (semantic patch for working with
the Coccinelle software) out on the discussed source files.


@checking_function_calls_directly@
identifier checker, retval, work;
expression list el;
statement is, es;
type rt;
@@
 rt checker(...)
 {
  <+...
-retval = work(el);
 if (
-    retval
+    work(el)
    )
    is
 else
    es
  ...+>
 }


Do you find such a source code transformation useful?

Regards,
Markus
