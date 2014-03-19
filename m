From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Wed, 19 Mar 2014 12:02:58 +0000
Subject: Re: [PATCH] Coccicheck: Remove memcpy to struct assignment test
Message-Id: <1395230578.12633.21.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1395177092-3023-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1395177092-3023-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Die, 2014-03-18 at 22:11 +0100, Peter Senna Tschudin wrote:
> The Coccinelle script scripts/coccinelle/misc/memcpy-assign.cocci look
> for opportunities to replace a call to memcpy by a struct assignment.
> This patch removes memcpy-assign.cocci as it is not clear that this
> convention has an impact on the generated code.

Using struct assignment keeps the type check and is just for this reason
always preferable over memcpy().

Kind regards,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

