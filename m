From: "Luck, Tony" <tony.luck@intel.com>
Date: Mon, 30 Jul 2012 16:48:14 +0000
Subject: RE: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'V
Message-Id: <3908561D78D1C84285E8C5FCA982C28F193723C9@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163512.GC13376@localhost>
In-Reply-To: <20120722163512.GC13376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>> Looks like include/linux/page-flags.h (which uses VM_BUG_ON) needs to have a
>> 
>> #include <linux/mmdebug.h>
>> 
>> to make sure it sees the define.
>> 
>
> There should be a patch in-flight to Andrew's tree that fixes this.

Can you check ... it is still broken in linux-next today (tag = next-20120730)

-Tony
