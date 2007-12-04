From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 04 Dec 2007 15:53:20 +0000
Subject: Re: [PATCH 3/3] drivers/serial/uartlite.c: Add missing of_node_put
Message-Id: <87bq96xxqn.fsf@macbook.be.48ers.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712022105480.3361@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712022105480.3361@ask.diku.dk> (Julia Lawall's message of "Sun\, 2 Dec 2007 21\:06\:54 +0100 \(CET\)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Julia" = Julia Lawall <julia@diku.dk> writes:

 Julia> From: Julia Lawall <julia@diku.dk>
 Julia> There should be an of_node_put when breaking out of a loop
 Julia> that iterates using for_each_compatible_node.

..

 Julia> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Bye, Peter Korsgaard
