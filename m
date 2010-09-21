From: Dan Carpenter <error27@gmail.com>
Date: Tue, 21 Sep 2010 07:05:59 +0000
Subject: Re: [PATCH] drivers/block/cciss.c (2.6.35.7): Fixed useless
Message-Id: <20100921070558.GA6234@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <115163.69814.qm@web45812.mail.sp1.yahoo.com>
In-Reply-To: <115163.69814.qm@web45812.mail.sp1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Which version of gcc are you using?  It doesn't print any error message
for me on version 4.3.2 (which is really old).

The idea is fine but the patch is all messed up.  First of all the it's
reversed.  It says '+' where it should say '-' and '-' where it should
say '+'.

Also your mail client has completely mangled it.  It has removed spaces
from the start of lines and changed the tabs to spaces.  Please read
Documentation/email-clients.txt and send an email to yourself.  Save the
email as raw text.  cat email.txt | patch -p1.

When that works resend it.  Add these people to the CC list:

Mike Miller <mike.miller@hp.com>
Jens Axboe <jaxboe@fusionio.com>
"Stephen M. Cameron" <scameron@beardog.cce.hp.com>
iss_storagedev@hp.com

Also you don't need to copy all 16 lines of error messages.  Just a
couple will do.  But do say which version of gcc you are using.

regards,
dan carpenter


