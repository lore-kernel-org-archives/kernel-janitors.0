From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jun 2012 17:25:23 +0000
Subject: automated warning notifications
Message-Id: <20120614172523.GB4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wfg@linux.intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Fengguang,

I also check new static checker warnings and sometimes email people.
I wonder if we are duplicating each others work.  For example, did
you send an email asking about the following Sparse warning:

sound/soc/codecs/ab8500-codec.c:1959:53: warning: cast truncates bits from constant value (1013 becomes 13)

Quite often those messages are false positive and the value is
truncated deliberately.  In this case it looks suspicious and I
would maybe email about it.  If I knew what kind of messages you
check and which you ignore that would help me.

Perhaps there is an email list I could subscribe to to see if you
had already sent a message.

regards,
dan carpenter
