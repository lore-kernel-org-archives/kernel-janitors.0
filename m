From: Henne <henne@nachtwindheim.de>
Date: Thu, 20 Apr 2006 22:33:29 +0000
Subject: [KJ] Janitortask
Message-Id: <44480C39.4040405@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44480174.4090601@nachtwindheim.de>
In-Reply-To: <44480174.4090601@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Okay,

but for the correctness it should be done. And I'll see something other 
that ALSA drivers ;).
Is there a prefered way for adding __init/__exit ?
In "writing an ALSA driver" it's static struct foo __init structname[]
and I've seen static struct foo structname[] __init
in the sources too. I know that this makes no difference to the 
compiler, but for the readability.

Greets
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
