From: David Miller <davem@davemloft.net>
Date: Tue, 13 Mar 2012 08:04:06 +0000
Subject: Re: [PATCH 3/3 v3] netxen: qlogic ethernet : Fix endian bug.
Message-Id: <20120313.010406.769202674785007195.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331624093-12598-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331624093-12598-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


You didn't even compile test this.

> -	if (*mac = cpu_to_le64(~0ULL)) {
> +	if (*mac = ~0ULL)) {

This is unacceptable, I'm ignoring you for at least a week.

