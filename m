From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jul 2017 10:26:04 +0000
Subject: Re: [PATCH] staging: pi433: fix a precedence bug
Message-Id: <20170719102604.dglgst6skrhv6mqg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719095157.3e2rnskjqbva2kwo@mwanda>
In-Reply-To: <20170719095157.3e2rnskjqbva2kwo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Actually, please drop this patch.  I looked at this one the same as I
did the other one, but I didn't look closely enough.  It's the same
situation where we have two bugs that probably cancel each other out
somewhat.  It maybe needs to be fixed by someone who can test the code.

In rf69_set_lna_gain() we should be left shifting << 3 but we don't.

regards,
dan carpenter

