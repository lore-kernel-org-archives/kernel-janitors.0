From: Jay Bourque <kernel@uranium235.org>
Date: Sun, 27 Jun 2004 19:24:32 +0000
Subject: [Kernel-janitors] set_current_state
Message-Id: <40DF1EF0.50406@uranium235.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

New guy here,

I've been following the discussion lately and with talk about the
TODO list badly needing updating, I was wondering how up to
date the kj.pl script is.  In particular, I ran it against the
net/core/dev.c file and it showed that current->state needs to be
changed to set_current_state. Is this still something that needs
to be done?

Thanks,
-Jay
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
