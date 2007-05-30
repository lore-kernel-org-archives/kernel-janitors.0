From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 30 May 2007 12:12:49 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 4/4] kernel 2.6 size macro clean ups
Message-Id: <Pine.LNX.4.64.0705300810440.13455@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C9A14.2060702@gmail.com>
In-Reply-To: <465C9A14.2060702@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 May 2007, Aaron Cripps wrote:

...
+#include <include/linux/kernel.h>
...

  the above is simply wrong as the file name should be simply
<linux/kernel.h>.  but the bigger issue, as i mentioned before, is
that you should include patches directly in the text of your post, not
as an attachment, since an attachment isn't included automatically in
the reply, which is what i would have preferred to do here.

  attachments:  bad.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
