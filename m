From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Apr 2016 07:32:57 +0000
Subject: Re: [PATCH net 2/3] udp_offload: Set encapsulation before inner completes.
Message-Id: <20160430073257.GT4298@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461964650-4779-2-git-send-email-jarno@ovn.org>
In-Reply-To: <1461964650-4779-2-git-send-email-jarno@ovn.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These patches look reasonable.  But can you update the changelogs for 2
and 3 to say the user visible effects of these bugs.

Resend it to the people from ./scripts/get_maintainer.pl -f net/ipv4/udp_offload.c

regards,
dan carpenter

