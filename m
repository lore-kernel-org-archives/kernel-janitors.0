From: Julia Lawall <julia@diku.dk>
Date: Wed, 15 Dec 2010 11:58:49 +0000
Subject: question about schedule_timeout
Message-Id: <Pine.LNX.4.64.1012151256280.8557@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I am wondering about the interaction between schedule_timeout and 
functions like local_irq_save, that turn off interrupts.  To my 
understanding, with schedule_timeout one sleeps until a timer interrupt is 
received.  But how can that be received if interrupts have been turned 
off?  I find this mostly in older code, but there are still some 
occurrences, and even in older code, I'm not sure to understand how it 
could have worked.

thanks,
julia
